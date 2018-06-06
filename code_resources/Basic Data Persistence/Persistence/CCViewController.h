//
//  CCViewController.h
//  Persistence
//

#import <UIKit/UIKit.h>

@interface CCViewController : UIViewController <UITextViewDelegate>
@property (strong, nonatomic) IBOutlet UISegmentedControl *segments;
@property (strong, nonatomic) IBOutlet UIProgressView *progressBar;
@property (strong, nonatomic) IBOutlet UISwitch *cSwitch;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIButton *spinningButton;
@property (strong, nonatomic) IBOutlet UISlider *slider1;
@property (strong, nonatomic) IBOutlet UISlider *slider2;
@property (strong, nonatomic) IBOutlet UISlider *slider3;
@property (strong, nonatomic) IBOutlet UITextView *textBox;
@property (strong, nonatomic) NSMutableDictionary *controlState;
@property (strong, nonatomic) NSMutableDictionary *sliderValues;

- (IBAction)toggleSpinner:(id)sender;
- (IBAction)controlValueChanged:(id)sender;

@end