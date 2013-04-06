//
//  TintDemo.h
//  UINavigationBarAdjustableTint
//
//  Created by Thomas Thorpe on 06/04/2013.
//  Copyright (c) 2013 Thomas Thorpe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TintDemo : UIViewController
- (IBAction)sliderChanged:(id)sender;
@property (strong, nonatomic) IBOutlet UISlider *slider;


//below are just properties and methods for the colour sliders, you dont need to do anything with them.
@property (strong, nonatomic) IBOutlet UISlider *redSlider;
@property (strong, nonatomic) IBOutlet UILabel *redLabel;
@property (strong, nonatomic) IBOutlet UISlider *greenSlider;
@property (strong, nonatomic) IBOutlet UILabel *greenLabel;
@property (strong, nonatomic) IBOutlet UISlider *blueSlider;
@property (strong, nonatomic) IBOutlet UILabel *blueLabel;
- (IBAction)colourSlidersChanged:(id)sender;


@end
