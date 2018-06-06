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
@property (retain, nonatomic) IBOutlet UIView *sectionView;
@property (retain, nonatomic) IBOutlet UIView *colorsView;
@property (retain, nonatomic) IBOutlet UIView *progressView;

@property (retain, nonatomic) IBOutlet UIView *displayColor;
@property (retain, nonatomic) IBOutlet UISlider *redSlider;
@property (retain, nonatomic) IBOutlet UISlider *greenSlider;
@property (retain, nonatomic) IBOutlet UISlider *blueSlider;
@property (retain, nonatomic) IBOutlet UISlider *alphaSlider;

@property (retain, nonatomic) IBOutlet UILabel *amountLabel;
@property (retain, nonatomic) IBOutlet UIStepper *amountStepper;
@property (retain, nonatomic) IBOutlet UISwitch *animatedSwitch;
@property (retain, nonatomic) IBOutlet UIProgressView *progressIndicator;

- (IBAction)simpleButtonPressed:(id)sender;
- (IBAction)textFieldTextDidChange:(id)sender;
- (IBAction)dismissKeyboard:(id)sender;
- (IBAction)colorSliderChanged;
- (IBAction)sectionChanged:(id)sender;

- (IBAction)resetContent:(id)sender;
- (IBAction)fillAmountChanged;

@end