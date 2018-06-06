//
//  RootViewController.m
//  SDK Demo
//

#import "RootViewController.h"

@implementation RootViewController
@synthesize buttonPressLabel = _buttonPressLabel;
@synthesize echoLabel = _echoLabel;
@synthesize sectionView = _sectionView;
@synthesize colorsView = _colorsView;
@synthesize progressView = _progressView;
@synthesize displayColor = _displayColor;
@synthesize redSlider = _redSlider;
@synthesize greenSlider = _greenSlider;
@synthesize blueSlider = _blueSlider;
@synthesize alphaSlider = _alphaSlider;
@synthesize amountLabel = _amountLabel;
@synthesize amountStepper = _amountStepper;
@synthesize animatedSwitch = _animatedSwitch;
@synthesize progressIndicator = _progressIndicator;

#pragma mark - Memory Management

#pragma mark - View lifecycle
- (void)viewDidLoad {
	buttonPressCount = 0;
	[self.sectionView addSubview:self.colorsView];
}

- (void)viewDidUnload {
    [self setSectionView:nil];
    [self setColorsView:nil];
    [self setProgressView:nil];
}

#pragma mark - Action Methods
- (IBAction)simpleButtonPressed:(id)sender {
	buttonPressCount++;
	NSString *pluralHandlerString = (buttonPressCount == 1) ? @"time" : @"times";
	NSString *displayString = [[NSString alloc] initWithFormat:@"%d %@", buttonPressCount, pluralHandlerString];
	self.buttonPressLabel.text = displayString;
}

- (IBAction)textFieldTextDidChange:(id)sender {
	UITextField *textField = (UITextField *)sender;
	NSString *textFieldText = textField.text;
	self.echoLabel.text = textFieldText;
}

- (IBAction)dismissKeyboard:(id)sender {
	[(UITextField *)sender resignFirstResponder];
}

- (IBAction)sectionChanged:(id)sender {
	UISegmentedControl *sectionControl = (UISegmentedControl *)sender;
	if (sectionControl.selectedSegmentIndex == 0)		// Colors section
		[self.sectionView addSubview:self.colorsView];
	else if (sectionControl.selectedSegmentIndex == 1)	// Progress section
		[self.sectionView addSubview:self.progressView];

}

- (IBAction)colorSliderChanged {
	float redColor = self.redSlider.value;
	float greenColor = self.greenSlider.value;
	float blueColor = self.blueSlider.value;
	float alphaValue = self.alphaSlider.value;
	UIColor *newBackground = [UIColor colorWithRed:redColor green:greenColor blue:blueColor alpha:alphaValue];
	self.displayColor.backgroundColor = newBackground;
}

- (IBAction)resetContent:(id)sender {
	self.amountStepper.value = 0.0;
	self.amountLabel.text = @"0%";
	[self.animatedSwitch setOn:YES animated:YES];
	[self.progressIndicator setProgress:0.0 animated:YES];
}

- (IBAction)fillAmountChanged {
	NSInteger amount = (NSInteger)self.amountStepper.value;
	// You need two percents to "escape" it and actually display a percent sign
	NSString *amountString = [NSString stringWithFormat:@"%d%%", amount];
	self.amountLabel.text = amountString;
	[self.progressIndicator setProgress:((float)amount / 100.0) animated:self.animatedSwitch.on];
}
@end