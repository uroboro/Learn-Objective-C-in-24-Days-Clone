//
//  FlipViewController.m
//  SDK Demo
//

#import "FlipViewController.h"

@implementation FlipViewController
@synthesize frontView, backView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	[self.view addSubview:self.frontView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma mark - Flipping Methods
- (IBAction)flipToBack:(id)sender {
	[UIView transitionFromView:self.frontView toView:self.backView duration:1.0 options:(UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionFlipFromRight) completion:NULL];
}

- (IBAction)flipToFront:(id)sender {
	[UIView transitionFromView:self.backView toView:self.frontView duration:1.0 options:(UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionFlipFromLeft) completion:NULL];
}

#pragma mark - Rotation
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	return (toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end