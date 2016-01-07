//
//  ViewController.m
//  JSON
//
//  Created by Sanket Bhavsar on 12/22/15.
//  Copyright (c) 2015 Sanket Bhavsar. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize token,user,pass;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    dataFetchService = [[DataFetchService alloc]init];
    [self login];
    mainarr = [[NSArray alloc]init];
    NSLog(@"%@%@",user,pass);
    activityView = [[UIActivityIndicatorView alloc]
                                             initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    activityView.center=self.view.center;
    [activityView startAnimating];
    [self.view addSubview:activityView];
}

-(void)login
{
    NSString *Username= user;
    NSString *Password= pass;
    NSLog(@"%@%@",Username,Password);
    dataFetchService = [[DataFetchService alloc]init];
    NSMutableDictionary * dict = [[NSMutableDictionary alloc]initWithObjectsAndKeys:Username,@"username",Password,@"password",nil];
    
    NSString *loginMethod = @"Login";
    // NSString *wbsUrlName =[NSString stringWithFormat:@"%@%@%@",@Url,@loginSp,loginMethod];
    
    NSString *wbsUrlName =[NSString stringWithFormat:@"%s%s%@",URL,LOGINSP,loginMethod];
    
    NSLog(@"Url:-  %@",wbsUrlName);
    
    [dataFetchService simplePostMethod:dict  WebServiceName:wbsUrlName WithCompletionBlock:^(NSData *data,NSURLResponse *response,NSError *error)
     {
         if(!error)
         {
             NSDictionary* jsonResponse = [NSJSONSerialization JSONObjectWithData:data
                                                                          options:kNilOptions
                                                                            error:&error];
             NSLog(@" Login JSON Response is: %@",jsonResponse);
             
             //StatusCode StatusMessage
             NSNumber *status = [jsonResponse valueForKey:@"Status"];
             NSString *message = [jsonResponse valueForKey:@"Message"];
             token = [jsonResponse valueForKey:@"Token"];
             //NSLog(@"%@",message);
             if([status intValue] == 1)
             {
                 [self Order];
             }
             else{
                 alert = [[UIAlertView alloc] initWithTitle:@"" message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                 [alert show];
             }
             
         }
         else {
             NSLog(@"error %@",error);
         }
         
         
     }];
}

-(void)Order
{
    dataFetchService = [[DataFetchService alloc]init];
    NSString *wbsUrlName =@"http://mymerchant.intelgain.com/api/MerchantOrder.php/getOrderList";
    NSMutableDictionary * dict = [[NSMutableDictionary alloc]initWithObjectsAndKeys:token,@"Token",nil];
    
    [dataFetchService simplePostMethod:dict WebServiceName:wbsUrlName WithCompletionBlock:^(NSData *data,NSURLResponse *response,NSError *error)
     {
         if(!error)
         {
             NSDictionary* jsonResponse = [NSJSONSerialization JSONObjectWithData:data
                                                                          options:kNilOptions
                                                                            error:&error];
             //NSLog(@" Login JSON Response is: %@",jsonResponse);
             
             mainarr = [jsonResponse valueForKey:@"orders"];
             NSLog(@" Orders: %lu",(unsigned long)[mainarr count]);
             [self.tableView2 reloadData];
             [activityView stopAnimating];
         }
     }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@" Orders: %lu",(unsigned long)[mainarr count]);
    return [mainarr count];
    //return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"myCell";
    
    myTableViewCell *cell = [self.tableView2 dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"myTableViewCell" owner:self options:nil]objectAtIndex:0];
    }
    
    NSDictionary *subd = [mainarr objectAtIndex:indexPath.row];
    
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        cell.lblname.text = [subd valueForKey:@"customer_name"];
        cell.lbldate.text = [subd valueForKey:@"Date"];
        cell.lblnumber.text = [subd valueForKey:@"OrderNumber"];
        cell.lblstatus.text = [subd valueForKey:@"OrderStatus"];
    });
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
