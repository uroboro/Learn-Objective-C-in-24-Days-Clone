//
//  CCViewController.m
//  Persistence
//

#import "CCViewController.h"

@interface CCViewController ()

@end

@implementation CCViewController
@synthesize segments;
@synthesize progressBar;
@synthesize cSwitch;
@synthesize spinner;
@synthesize textField;
@synthesize spinningButton;
@synthesize slider1;
@synthesize slider2;
@synthesize slider3;
@synthesize textBox;
@synthesize controlState;
@synthesize sliderValues;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.controlState = [NSMutableDictionary dictionary];
	self.sliderValues = [NSMutableDictionary dictionary];
}

- (void)viewDidUnload
{
    [self setSegments:nil];
    [self setProgressBar:nil];
    [self setCSwitch:nil];
    [self setSpinner:nil];
    [self setTextField:nil];
    [self setSpinningButton:nil];
    [self setSlider1:nil];
    [self setSlider2:nil];
    [self setSlider3:nil];
    [self setTextBox:nil];
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	// Load segmented control selection
	int selectedSegmentIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"SelectedSegmentIndex"];
	self.segments.selectedSegmentIndex = selectedSegmentIndex;
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectoryPath = [paths objectAtIndex:0];
	
	// Load data from plist
	if ([[self.controlState allKeys] count] == 0) {
		NSString *filePath = [documentsDirectoryPath stringByAppendingPathComponent:@"componentState.plist"];
		self.controlState = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
		
		if ([[self.controlState objectForKey:@"SpinnerAnimatingState"] boolValue])
			[self.spinner startAnimating];
		else
			[self.spinner stopAnimating];
		
		self.cSwitch.enabled = [[self.controlState objectForKey:@"SwitchEnabledState"] boolValue];
		
		self.progressBar.progress = [[self.controlState objectForKey:@"ProgressBarProgress"] floatValue];
		
		self.textField.text = [self.controlState objectForKey:@"TextFieldContents"];
	}
	
	// Decode objects
	if ([[self.sliderValues allKeys] count] == 0) {
		NSMutableData *data = [[NSMutableData alloc] initWithContentsOfFile:[documentsDirectoryPath stringByAppendingPathComponent:@"archivedObjects"]];
		NSKeyedUnarchiver *decoder = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
		self.sliderValues = [decoder decodeObjectForKey:@"SliderValues"];
		self.slider1.value = [[self.sliderValues objectForKey:@"Slider1Key"] floatValue];
		self.slider2.value = [[self.sliderValues objectForKey:@"Slider2Key"] floatValue];
		self.slider3.value = [[self.sliderValues objectForKey:@"Slider3Key"] floatValue];
	}
	
	// Read text file
	NSString *textViewData = [NSString stringWithContentsOfFile:[documentsDirectoryPath stringByAppendingPathComponent:@"TextViewContents.txt"] encoding:NSUTF8StringEncoding error:nil];
	self.textBox.text = textViewData;
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)toggleSpinner:(id)sender {
	if (self.spinner.isAnimating) {
		[self.spinner stopAnimating];
		((UIButton *)sender).titleLabel.text = @"Start spinning";
		[self.controlState setValue:[NSNumber numberWithBool:NO] forKey:@"SpinnerAnimatingState"];
	}
	else {
		[self.spinner startAnimating];
		((UIButton *)sender).titleLabel.text = @"Stop spinning";
		[self.controlState setValue:[NSNumber numberWithBool:YES] forKey:@"SpinnerAnimatingState"];
	}
}

- (IBAction)controlValueChanged:(id)sender {
	if (!self.controlState)
		self.controlState = [NSMutableDictionary dictionary];
	if (!self.sliderValues)
		self.sliderValues = [NSMutableDictionary dictionary];
	if (sender == self.segments) {
		int selectedSegment = ((UISegmentedControl *)sender).selectedSegmentIndex;
		[[NSUserDefaults standardUserDefaults] setInteger:selectedSegment forKey:@"SelectedSegmentIndex"];
	}
	else if (sender == self.cSwitch)
		[self.controlState setValue:[NSNumber numberWithBool:self.cSwitch.enabled] forKey:@"SwitchEnabledState"];
	else if (sender == self.textField)
		[self.controlState setValue:self.textField.text forKey:@"TextFieldContents"];
	else if (sender == self.slider1) {
		[self.sliderValues setValue:[NSNumber numberWithFloat:self.slider1.value] forKey:@"Slider1Key"];
		// Update progress bar with slider
		[self.progressBar setProgress:self.slider1.value];
		[self.controlState setValue:[NSNumber numberWithFloat:self.progressBar.progress] forKey:@"ProgressBarProgress"];
	}
	else if (sender == self.slider2)
		[self.sliderValues setValue:[NSNumber numberWithFloat:self.slider2.value] forKey:@"Slider2Key"];
	else if (sender == self.slider3)
		[self.sliderValues setValue:[NSNumber numberWithFloat:self.slider3.value] forKey:@"Slider3Key"];
	else
		return;
	
	// Save plist
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectoryPath = [paths objectAtIndex:0];
	NSString *filePath = [documentsDirectoryPath stringByAppendingPathComponent:@"componentState.plist"];
	[self.controlState writeToFile:filePath atomically:YES];
	
	// Archive object
	NSMutableData *data = [NSMutableData data];
	NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
	[archiver encodeObject:self.sliderValues forKey:@"SliderValues"];
	[archiver finishEncoding];
	NSString *dataPath = [documentsDirectoryPath stringByAppendingPathComponent:@"archivedObjects"];
	[data writeToFile:dataPath atomically:YES];
}

#pragma mark - Text View Delegate
- (void)textViewDidChange:(UITextView *)textView {
	NSString *textViewContents = textView.text;
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectoryPath = [paths objectAtIndex:0];
	NSString *filePath = [documentsDirectoryPath stringByAppendingPathComponent:@"TextViewContents.txt"];
	[textViewContents writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

// Dismiss keyboard
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
	if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}
@end
