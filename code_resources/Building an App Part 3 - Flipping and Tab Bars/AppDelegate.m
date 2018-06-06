//
//  AppDelegate.m
//  SDK Demo
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "FlipViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize rootViewController = _rootViewController;
@synthesize tabBarController = _tabBarController;

- (void)dealloc {
	[_window release];
	[_rootViewController release];
	[_tabBarController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
	RootViewController *rootViewController = [[RootViewController alloc] initWithNibName:@"RootViewController" bundle:nil];
	rootViewController.title = @"Root View Controller";
	FlipViewController *flipViewController = [[FlipViewController alloc] initWithNibName:@"FlipViewController" bundle:nil];
	flipViewController.title = @"Flip View Controller";
	self.tabBarController = [[UITabBarController alloc] init];
	self.tabBarController.viewControllers = [NSArray arrayWithObjects:rootViewController, flipViewController, nil];
	self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end