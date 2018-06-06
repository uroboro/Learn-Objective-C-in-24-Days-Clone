//
//  CustomDrawingViewController.m
//  SDK Demo
//

#import "CustomDrawingViewController.h"
#import "CustomView.h"

@interface CustomDrawingViewController ()

@end

@implementation CustomDrawingViewController
@synthesize viewTitle;
@synthesize mode;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithContentMode:(QuartzContentMode)contentMode {
	if (!(self = [super init]))
		return nil;
	self.mode = contentMode;
	return self;
}

- (void)loadView {
    // Implement loadView to create a view hierarchy programmatically, without using a nib.
	CustomView *customView = [[CustomView alloc] initWithFrame:CGRectMake(0, 44, 320, 480)];
	customView.mode = self.mode;
	self.view = customView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	if (!self.viewTitle)
		self.title = @"Custom Drawing";
	else
		self.title = self.viewTitle;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
