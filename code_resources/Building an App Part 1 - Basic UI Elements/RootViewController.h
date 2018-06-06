//
//  RootViewController.h
//  SDK Demo
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController {
	int buttonPressCount;
}

@property (nonatomic, retain) IBOutlet UILabel *buttonPressLabel;
@property (nonatomic, retain) IBOutlet UILabel *echoLabel;

- (IBAction)simpleButtonPressed:(id)sender;
- (IBAction)textFieldTextDidChange:(id)sender;
- (IBAction)dismissKeyboard:(id)sender;
@end