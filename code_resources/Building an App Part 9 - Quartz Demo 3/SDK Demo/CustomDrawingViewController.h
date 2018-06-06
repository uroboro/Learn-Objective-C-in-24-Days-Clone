//
//  CustomDrawingViewController.h
//  SDK Demo
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface CustomDrawingViewController : UIViewController
@property (strong, nonatomic) NSString *viewTitle;
@property (assign, nonatomic) QuartzContentMode mode;
- (id)initWithContentMode:(QuartzContentMode)contentMode;
@end
