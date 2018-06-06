//
//  KVCDemoAppDelegate.h
//  KVCDemo
//
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KVCDemoViewController;

@interface KVCDemoAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet KVCDemoViewController *viewController;

@end
