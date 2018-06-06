//
//  ARViewController.m
//  AutoRotate
//

#import "ARViewController.h"

@implementation ARViewController
@synthesize portraitView, landscapeView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#define degreesToRadians(x) (M_PI * (x) / 180.0)
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	if (toInterfaceOrientation == UIDeviceOrientationPortrait) {
		self.view = self.portraitView;
		self.view.transform = CGAffineTransformMakeRotation(degreesToRadians(0)); 
		self.view.bounds = CGRectMake(0.0, 0.0, 320.0, 460.0);
	}
	else if (toInterfaceOrientation == UIDeviceOrientationLandscapeRight) {
		self.view = self.landscapeView;
		self.view.transform = CGAffineTransformMakeRotation(degreesToRadians(-90)); 
		self.view.bounds = CGRectMake(0.0, 0.0, 480.0, 300.0);
	}
	else if (toInterfaceOrientation == UIDeviceOrientationLandscapeLeft) {
		self.view = self.landscapeView;
		self.view.transform = CGAffineTransformMakeRotation(degreesToRadians(90)); 
		self.view.bounds = CGRectMake(0.0, 0.0, 480.0, 300.0);
	}
	else
		return;
}

@end
