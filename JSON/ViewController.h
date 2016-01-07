//
//  ViewController.h
//  JSON
//
//  Created by Sanket Bhavsar on 12/22/15.
//  Copyright (c) 2015 Sanket Bhavsar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataFetchService.h"
#import "myTableViewCell.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

#define URL "http://mymerchant.intelgain.com/api/"

#define LOGINSP "Merchant.php/"

{
    DataFetchService *dataFetchService;
    UIAlertView *alert;
    NSArray *mainarr;
    UIActivityIndicatorView *activityView;
}
@property(nonatomic,retain) IBOutlet UITableView *tableView2;
@property(nonatomic,strong) NSString *token,*user,*pass;

@end

