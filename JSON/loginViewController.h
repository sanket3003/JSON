//
//  loginViewController.h
//  JSON
//
//  Created by Sanket Bhavsar on 12/22/15.
//  Copyright (c) 2015 Sanket Bhavsar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface loginViewController : UIViewController
{
    UIAlertView *alert;
    //ViewController *myView;
    //ViewController *vc;
}
@property IBOutlet UITextField *txt_user;
@property IBOutlet UITextField *txt_pass;
@property IBOutlet UIButton *btn_submit;
-(IBAction)submit:(id)sender;

//@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;
@end
