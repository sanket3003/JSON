//
//  loginViewController.m
//  JSON
//
//  Created by Sanket Bhavsar on 12/22/15.
//  Copyright (c) 2015 Sanket Bhavsar. All rights reserved.
//

#import "loginViewController.h"

@interface loginViewController ()

@end

@implementation loginViewController
@synthesize txt_user,txt_pass,btn_submit;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //self.loginButton. = @[@"public_profile", @"email"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    ViewController *vc = [segue destinationViewController];
    vc.user = txt_user.text;
    vc.pass = txt_pass.text;
}

-(IBAction)submit:(id)sender
{
    if ([txt_user.text isEqualToString: @""] && [txt_pass.text isEqualToString: @""]) {
        
        alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Please enter UserName & Password to Sign In" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
    else if([txt_user.text isEqualToString: @""] )
    {
        alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Please enter UserName" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
    else if([txt_pass.text isEqualToString: @""] )
    {
        alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Please enter Password" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
    else if([txt_user.text isEqualToString: @"cashcarry"] && [txt_pass.text isEqualToString: @"cashcarry"])
    {
        //NSLog(@"Login Successful");
        //[self login];
        
        /*ViewController *vc = [segue destinationViewController];
        vc.user = txt_user.text;
        vc.pass = txt_pass.text;*/
        [self performSegueWithIdentifier:@"next" sender:nil];
    }
    else
    {
        alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Incorrect username or Password" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
