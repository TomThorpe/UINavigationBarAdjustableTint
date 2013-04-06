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

#import <UIKit/UIKit.h>

@interface TTUINavigationBarAdjustableTint : UINavigationBar

/**  @property colourAdjustFactor
 *   @brief The brightness to adjust the top of the UINavigationBar's gradient, relative to the tintColor property.
 *   The brightness to adjust the top of the UINavigationBar's gradient, relative to the tintColor property. 
 *   E.g:
 *      -If you set this to 1 the gradient will be a flat colour from top to bottom (no change).
 *      -If you set this to 0, the top of the gradient will be black, and the bottom will be the tintColor
 *      -Anything between 0 and 1 the bottom of the gradient will be the tintColor, and the top of the gradient will be darker than the bottom, relative to how close to 0 the value is.
 *      -Anything above 1, the bottom of the gradient will be the tintColor, and the top will be brighter than the bottom relative to how high the number is.
 */
@property(nonatomic) float colourAdjustFactor;

@end
