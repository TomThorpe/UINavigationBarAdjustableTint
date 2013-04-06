//
//  TTUINavigationBarAdjustableTint
//  UINavigationBarAdjustableTint
//
//  Created by Thomas Thorpe on 05/04/2013.
//
//CREDIT TO coneybeare on stackoverflow at  http://stackoverflow.com/questions/1852319/uinavigationbar-gradient-details for the original concept of how to draw the gradient

/*
 Copyright (c) 2012 Tom Thorpe. All rights reserved.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of
 this software and associated documentation files (the "Software"), to deal in
 the Software without restriction, including without limitation the rights to
 use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
 of the Software, and to permit persons to whom the Software is furnished to do
 so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

#import "TTUINavigationBarAdjustableTint.h"


@implementation TTUINavigationBarAdjustableTint

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.colourAdjustFactor = 1;
    }
    return self;
}

#pragma -mark Property Setters

-(void)setColourAdjustFactor:(float)colourAdjustFactor{
    //set the property, then trigger a refresh to re-call drawRect with the new colour
    _colourAdjustFactor = colourAdjustFactor;
    [self setNeedsDisplay];
}

#pragma -mark Methods

- (UIColor *)adjustColourBrightness:(UIColor *)color withFactor:(double)factor
{
    CGColorRef cgColour = [color CGColor];
	CGFloat *oldComponents = (CGFloat *)CGColorGetComponents(cgColour);
	CGFloat newComponents[4];
    
	int numComponents = CGColorGetNumberOfComponents(cgColour);
    
	switch (numComponents)
	{
		case 2:
		{
			//grayscale
			newComponents[0] = oldComponents[0]*factor;
			newComponents[1] = oldComponents[0]*factor;
			newComponents[2] = oldComponents[0]*factor;
			newComponents[3] = oldComponents[1];
			break;
		}
		case 4:
		{
			//RGBA
			newComponents[0] = oldComponents[0]*factor;
			newComponents[1] = oldComponents[1]*factor;
			newComponents[2] = oldComponents[2]*factor;
			newComponents[3] = oldComponents[3];
			break;
		}
	}
    
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGColorRef newColor = CGColorCreate(colorSpace, newComponents);
	CGColorSpaceRelease(colorSpace);
    
	UIColor *retColor = [UIColor colorWithCGColor:newColor];
	CGColorRelease(newColor);
    
	return retColor;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    if (self.tintColor == nil){
        NSLog(@"UINavigationBarAdjustableTint: Didn't do anything because there is no tint colour set. Please set the tintColor property.");
        return; //dont do anything if we dont have a tint colour.
    }
    
    UIColor *bottomColor = self.tintColor;
    UIColor *topColor = [self adjustColourBrightness:bottomColor withFactor:self.colourAdjustFactor];

    
    // emulate the normal gradient tint
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat locations[2] = { 0.0, 1.0 };
    CGColorSpaceRef myColorspace = CGColorSpaceCreateDeviceRGB();
    
    NSArray *colours = [NSArray arrayWithObjects:(__bridge id)topColor.CGColor, (__bridge id) bottomColor.CGColor, nil];
    CGGradientRef gradient = CGGradientCreateWithColors(myColorspace, (__bridge CFArrayRef)colours, locations);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(0,self.frame.size.height), 0);
    CGGradientRelease(gradient);
    
    CGColorSpaceRelease(myColorspace);
    
    // top Line 1 px high across the very top of the bar slightly lighter colour than the top gradient color
    CGContextSetStrokeColorWithColor(context, [[self adjustColourBrightness:topColor withFactor:1.5] CGColor]);
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, self.frame.size.width, 0);
    CGContextStrokePath(context);
    
    // bottom line 1px across the bottom of the bar in black
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1.0);
    CGContextMoveToPoint(context, 0, self.frame.size.height);
    CGContextAddLineToPoint(context, self.frame.size.width, self.frame.size.height);
    CGContextStrokePath(context);
}

@end
