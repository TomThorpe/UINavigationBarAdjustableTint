//
//  TTAppDelegate.m
//  UITableViewZoomController
//
//  Created by Thomas Thorpe on 25/02/2013.
//  Copyright (c) 2013 Thomas Thorpe. All rights reserved.
//

#import "TTAppDelegate.h"
#import "TintDemo.h"
#import "TTUINavigationBarAdjustableTint.h"

@implementation TTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //create a UINavigationController, and set the UINavigationBar to be the custom TTUINavigationBarAdjustableTint from the Source folder.
    UINavigationController *navigationController = [[UINavigationController alloc] initWithNavigationBarClass:[TTUINavigationBarAdjustableTint class] toolbarClass:nil];
    
    //now just doing the usual stuff of adding a viewController to the navigationController, and making the navigationController the rootViewController for the window.
    UIViewController *mainViewController;
    mainViewController = [[TintDemo alloc] init];
    [navigationController setViewControllers:[NSArray arrayWithObject:mainViewController]];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
