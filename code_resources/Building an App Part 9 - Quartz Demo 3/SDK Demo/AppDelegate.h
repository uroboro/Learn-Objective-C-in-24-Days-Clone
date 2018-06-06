//
//  AppDelegate.h
//  SDK Demo
//

#import <UIKit/UIKit.h>

@class RootViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) UITabBarController *tabBarController;
@property (nonatomic, strong) RootViewController *rootViewController;

@end