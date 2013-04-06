//
//  TintDemo.m
//  UINavigationBarAdjustableTint
//
//  Created by Thomas Thorpe on 06/04/2013.
//  Copyright (c) 2013 Thomas Thorpe. All rights reserved.
//

#import "TintDemo.h"
#import "TTUINavigationBarAdjustableTint.h"
#import <QuartzCore/QuartzCore.h>

@interface TintDemo ()

@end

@implementation TintDemo

- (IBAction)sliderChanged:(id)sender {
    //This assumes the navigationController has already been set up with the correct type of navigationBar in the App Delegate (see TTAppDelegate.m didFinishLaunchingWithOptions method.
    
    //get the TTUINavigationBarAdjustableTint instance from the navigationController, by casting the navigationBar property (we know the navigationBar is of this type because that's how we set it up in the App Delegate)
    TTUINavigationBarAdjustableTint *navigationBar = (TTUINavigationBarAdjustableTint *)self.navigationController.navigationBar;
    
    //set the tint adjustment of the bar to the value from the slider.
    navigationBar.colourAdjustFactor = self.slider.value;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //the lines below in this method are just for appearance, you don't have to do this.
    self.navigationItem.title = @"NavBar Adjust Tint";
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wavegrid.png"]];
    self.sliderContainer.layer.borderColor = [UIColor grayColor].CGColor;
    self.sliderContainer.layer.borderWidth = 2.0f;
    self.sliderContainer.layer.cornerRadius = 4.0f;
}

@end
