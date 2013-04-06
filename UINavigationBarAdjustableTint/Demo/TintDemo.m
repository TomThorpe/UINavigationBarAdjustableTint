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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //set the tint colour of the navigation bar as usual (setting it to a deep red here)
    float initialRed = 150;
    float initialGreen = 22;
    float initialBlue = 18;
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:initialRed/255.0f green:initialGreen/255.0f blue:initialBlue/255.0f alpha:1.0f];
    
    //now, set the initial adjustment factor of the tint by casting the navigation controllers navigationBar to our class, and setting the property. I'll set it to 1.2 for now to make it slightly lighter.
    ((TTUINavigationBarAdjustableTint *)self.navigationController.navigationBar).colourAdjustFactor = 1.2;
    
    
    //the lines below in this method are just for appearance, you don't have to do this.
    self.navigationItem.title = @"NavBar Adjust Tint";
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"diamond_upholstery.png"]];
    self.redSlider.value = initialRed;
    self.greenSlider.value = initialGreen;
    self.blueSlider.value = initialBlue;
}


- (IBAction)sliderChanged:(id)sender {
    //This assumes the navigationController has already been set up with the correct type of navigationBar in the App Delegate (see TTAppDelegate.m didFinishLaunchingWithOptions method.
    
    //get the TTUINavigationBarAdjustableTint instance from the navigationController, by casting the navigationBar property (we know the navigationBar is of this type because that's how we set it up in the App Delegate)
    TTUINavigationBarAdjustableTint *navigationBar = (TTUINavigationBarAdjustableTint *)self.navigationController.navigationBar;
    
    //set the tint adjustment of the bar to the value from the slider.
    navigationBar.colourAdjustFactor = self.slider.value;
    
}

- (IBAction)colourSlidersChanged:(id)sender {
    if (self.navigationController == nil || self.navigationController.navigationBar == nil){
        return;
    }
    
    //Update the navigation bar with the new tint colour. This is just for the demo purposes for oyu to be able to try the different colours with the tint, and isn't really anything to do with this library.
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:self.redSlider.value/255.0f green:self.greenSlider.value/255.0f blue:self.blueSlider.value/255.0f alpha:1.0f];
    self.redLabel.text = [NSString stringWithFormat:@"%.f", self.redSlider.value];
    self.greenLabel.text = [NSString stringWithFormat:@"%.f", self.greenSlider.value];
    self.blueLabel.text = [NSString stringWithFormat:@"%.f", self.blueSlider.value];
}



@end
