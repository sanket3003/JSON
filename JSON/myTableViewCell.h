//
//  myTableViewCell.h
//  JSON
//
//  Created by Sanket Bhavsar on 12/22/15.
//  Copyright (c) 2015 Sanket Bhavsar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myTableViewCell : UITableViewCell
@property (strong,nonatomic) IBOutlet UILabel *lblname;
@property (strong,nonatomic) IBOutlet UILabel *lbldate;
@property (strong,nonatomic) IBOutlet UILabel *lblnumber;
@property (strong,nonatomic) IBOutlet UILabel *lblstatus;
@end
