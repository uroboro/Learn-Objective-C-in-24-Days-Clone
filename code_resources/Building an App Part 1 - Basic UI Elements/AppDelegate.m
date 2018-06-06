//
//  AppDelegate.m
//  SDK Demo
//

#import "AppDelegate.h"
#import "RootViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize rootViewController = _rootViewController;

- (void)dealloc {
	[_window release];
	[_rootViewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
	_rootViewController = [[RootViewController alloc] init];
	self.window.rootViewController = self.rootViewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end