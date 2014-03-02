//
//  UIColor+SimpleColor.h
//
//  Created by Matej Hrescak on 3/2/14.
//  Copyright (c) 2014 Matej Hrescak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SimpleColor)

+ (UIColor *)colorWithHex:(NSString *)hexString;
+ (UIColor *)colorWithHex:(NSString *)hexString alpha:(CGFloat)alpha;
+ (UIColor *)colorWith8BitRed:(int)red green:(int)green blue:(int)blue;
+ (UIColor *)colorWith8BitRed:(int)red green:(int)green blue:(int)blue alpha:(CGFloat)alpha;

@end
