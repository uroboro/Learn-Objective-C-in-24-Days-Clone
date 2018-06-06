//
//  KVCDemoViewController.h
//  KVCDemo
//
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KVCDemoViewController : UIViewController {
    
    UILabel *label0;
    UILabel *label1;
    UILabel *label2;
    UILabel *label3;
    UILabel *label4;
    UILabel *label5;
    UILabel *label6;
    UILabel *label7;
    UILabel *label8;
    UILabel *label9;
    UILabel *resultLabel;
}
@property (nonatomic, retain) IBOutlet UILabel *label0;
@property (nonatomic, retain) IBOutlet UILabel *label1;
@property (nonatomic, retain) IBOutlet UILabel *label2;
@property (nonatomic, retain) IBOutlet UILabel *label3;
@property (nonatomic, retain) IBOutlet UILabel *label4;
@property (nonatomic, retain) IBOutlet UILabel *label5;
@property (nonatomic, retain) IBOutlet UILabel *label6;
@property (nonatomic, retain) IBOutlet UILabel *label7;
@property (nonatomic, retain) IBOutlet UILabel *label8;
@property (nonatomic, retain) IBOutlet UILabel *label9;
@property (nonatomic, retain) IBOutlet UILabel *resultLabel;

- (IBAction)getLotteryNumber:(id)sender;

@end
