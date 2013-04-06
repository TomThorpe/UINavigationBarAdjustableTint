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
    
    //set the tint colour as usual (setting it to a deep red here)
    navigationController.navigationBar.tintColor = [UIColor colorWithRed:114/255.0f green:15/255.0f blue:0/255.0f alpha:1.0f];
    
    //now, set the initial adjustment factor of the tint by casting the navigation controllers navigationBar to our class, and setting the property. I'll set it to 1.2 for now to make it slightly lighter.
    ((TTUINavigationBarAdjustableTint *)navigationController.navigationBar).colourAdjustFactor = 1.2;
    
    //now just doing the usual stuff of adding a viewController to the navigationController, and making the navigationController the rootViewController for the window.
    UIViewController *mainViewController;
    mainViewController = [[TintDemo alloc] init];
    [navigationController setViewControllers:[NSArray arrayWithObject:mainViewController]];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
