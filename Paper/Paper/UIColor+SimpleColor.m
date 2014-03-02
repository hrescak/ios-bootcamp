//
//  UIColor+SimpleColor.m
//
//  Created by Matej Hrescak on 3/2/14.
//  Copyright (c) 2014 Matej Hrescak. All rights reserved.
//

#import "UIColor+SimpleColor.h"

@implementation UIColor (SimpleColor)

#pragma mark - Hex Colors

+ (UIColor *)colorWithHex:(NSString *)hexString
{
    return [UIColor colorWithHex:hexString alpha:1.0];
}

+ (UIColor *)colorWithHex:(NSString *)hexString alpha:(CGFloat)alpha
{
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    if ([[hexString substringToIndex:1]  isEqual: @"#"]) {
        [scanner setScanLocation:1];
    }
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:alpha];
}

# pragma mark - 8bit Colors

+(UIColor *)colorWith8BitRed:(int)red green:(int)green blue:(int)blue
{
    return [UIColor colorWith8BitRed:red green:green blue:blue alpha:1];
}

+(UIColor *)colorWith8BitRed:(int)red green:(int)green blue:(int)blue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

@end
