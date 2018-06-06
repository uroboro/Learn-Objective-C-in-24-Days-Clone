//
//  AppDelegate.h
//  SDK Demo
//

#import <UIKit/UIKit.h>

@class RootViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) UITabBarController *tabBarController;
@property (nonatomic, retain) RootViewController *rootViewController;

@end