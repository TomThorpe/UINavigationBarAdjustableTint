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
@property (strong, nonatomic) IBOutlet UIView *sliderContainer;

@end
