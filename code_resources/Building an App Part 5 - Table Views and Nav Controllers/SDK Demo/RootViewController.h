//
//  RootViewController.h
//  SDK Demo
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController {
	int buttonPressCount;
}

@property (nonatomic, strong) IBOutlet UILabel *buttonPressLabel;
@property (nonatomic, strong) IBOutlet UILabel *echoLabel;
@property (strong, nonatomic) IBOutlet UIView *sectionView;
@property (strong, nonatomic) IBOutlet UIView *colorsView;
@property (strong, nonatomic) IBOutlet UIView *progressView;

@property (strong, nonatomic) IBOutlet UIView *displayColor;
@property (strong, nonatomic) IBOutlet UISlider *redSlider;
@property (strong, nonatomic) IBOutlet UISlider *greenSlider;
@property (strong, nonatomic) IBOutlet UISlider *blueSlider;
@property (strong, nonatomic) IBOutlet UISlider *alphaSlider;

@property (strong, nonatomic) IBOutlet UILabel *amountLabel;
@property (strong, nonatomic) IBOutlet UIStepper *amountStepper;
@property (strong, nonatomic) IBOutlet UISwitch *animatedSwitch;
@property (strong, nonatomic) IBOutlet UIProgressView *progressIndicator;

- (IBAction)simpleButtonPressed:(id)sender;
- (IBAction)textFieldTextDidChange:(id)sender;
- (IBAction)dismissKeyboard:(id)sender;
- (IBAction)colorSliderChanged;
- (IBAction)sectionChanged:(id)sender;

- (IBAction)resetContent:(id)sender;
- (IBAction)fillAmountChanged;

@end