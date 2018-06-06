//
//  KVCDemoViewController.m
//  KVCDemo
//
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KVCDemoViewController.h"

@implementation KVCDemoViewController
@synthesize label0;
@synthesize label1;
@synthesize label2;
@synthesize label3;
@synthesize label4;
@synthesize label5;
@synthesize label6;
@synthesize label7;
@synthesize label8;
@synthesize label9;
@synthesize resultLabel;

- (void)dealloc
{
    [label0 release];
    [label1 release];
    [label0 release];
    [label2 release];
    [label4 release];
    [label3 release];
    [label4 release];
    [label5 release];
    [label6 release];
    [label7 release];
    [label8 release];
    [label9 release];
    [resultLabel release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
} */


- (void)viewDidUnload
{
    [self setLabel0:nil];
    [self setLabel1:nil];
    [self setLabel2:nil];
    [self setLabel4:nil];
    [self setLabel3:nil];
    [self setLabel4:nil];
    [self setLabel5:nil];
    [self setLabel6:nil];
    [self setLabel7:nil];
    [self setLabel8:nil];
    [self setLabel9:nil];
    [self setResultLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)clearAllLabelFills {
    /** Loop through each value, 1–10
              Get the label that corresponds with that number
              Set its background color to a clear color (a nil UIColor corresponds to a transparent color */
    for (int count = 0; count < 10; count++)
        ((UILabel *)[self valueForKey:[NSString stringWithFormat:@"label%d", count]]).backgroundColor = nil;
}

- (IBAction)getLotteryNumber:(id)sender {
    /** Gets random number
              arc4random() returns a random value between 0 and 4294967296
              Mod by 10 to get a value in the range of 0–10 */
    int randomNumber = arc4random() % 10;
    // Output result in resultLabel
    self.resultLabel.text = [NSString stringWithFormat:@"Random number is %d", randomNumber];
    /** Clear old highlight */
    [self clearAllLabelFills];
    /** Use our randomNumber to get the corresponding label, then set its background color */
    ((UILabel *)[self valueForKey:[NSString stringWithFormat:@"label%d", randomNumber]]).backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5];
}
@end
