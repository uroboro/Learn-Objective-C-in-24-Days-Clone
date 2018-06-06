//
//  AppDelegate.m
//  SDK Demo
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "FlipViewController.h"
#import "GraphicsTableViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize rootViewController = _rootViewController;
@synthesize tabBarController = _tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
	RootViewController *rootViewController = [[RootViewController alloc] initWithNibName:@"RootViewController" bundle:nil];
	rootViewController.title = @"Root View Controller";
	FlipViewController *flipViewController = [[FlipViewController alloc] initWithNibName:@"FlipViewController" bundle:nil];
	flipViewController.title = @"Flip View Controller";
	GraphicsTableViewController *graphicsTableViewController = [[GraphicsTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
	UINavigationController *graphicsNavController = [[UINavigationController alloc] initWithRootViewController:graphicsTableViewController];
	graphicsNavController.title = @"Graphics Demo";
	self.tabBarController = [[UITabBarController alloc] init];
	self.tabBarController.viewControllers = [NSArray arrayWithObjects:rootViewController, flipViewController, graphicsNavController, nil];
	self.window.rootViewController = self.tabBarController;
	[self.window makeKeyAndVisible];
    return YES;
}

@end