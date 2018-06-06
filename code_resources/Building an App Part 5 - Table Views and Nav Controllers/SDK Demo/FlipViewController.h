//
//  FlipViewController.h
//  SDK Demo
//

#import <UIKit/UIKit.h>

@interface FlipViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *frontView;
@property (strong, nonatomic) IBOutlet UIView *backView;

- (IBAction)flipToBack:(id)sender;
- (IBAction)flipToFront:(id)sender;

@end
