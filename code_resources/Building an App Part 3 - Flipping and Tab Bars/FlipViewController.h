//
//  FlipViewController.h
//  SDK Demo
//

#import <UIKit/UIKit.h>

@interface FlipViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIView *frontView;
@property (retain, nonatomic) IBOutlet UIView *backView;

- (IBAction)flipToBack:(id)sender;
- (IBAction)flipToFront:(id)sender;

@end
