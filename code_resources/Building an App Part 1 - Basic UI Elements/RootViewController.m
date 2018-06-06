//
//  RootViewController.m
//  SDK Demo
//

#import "RootViewController.h"

@implementation RootViewController
@synthesize buttonPressLabel = _buttonPressLabel;
@synthesize echoLabel = _echoLabel;

#pragma mark - Memory Management
- (void)dealloc {
	[_buttonPressLabel release];
	[_echoLabel release];
}

#pragma mark - View lifecycle
- (void)viewDidLoad {
	buttonPressCount = 0;
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view to relieve memory usage
	self.buttonPressLabel = nil;
	self.echoLabel = nil;
}

#pragma mark - Action Methods
- (IBAction)simpleButtonPressed:(id)sender {
	buttonPressCount++;
	NSString *pluralHandlerString = (buttonPressCount == 1) ? @"time" : @"times";
	NSString *displayString = [[NSString alloc] initWithFormat:@"Button pressed %d %@", buttonPressCount, pluralHandlerString];
	self.buttonPressLabel.text = displayString;
	[displayString release];
}

- (IBAction)textFieldTextDidChange:(id)sender {
	UITextField *textField = (UITextField *)sender;
	NSString *textFieldText = textField.text;
	self.echoLabel.text = textFieldText;
}

- (IBAction)dismissKeyboard:(id)sender {
	[(UITextField *)sender resignFirstResponder];
}
@end