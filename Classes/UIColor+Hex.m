//
//  UIColor+Hex.m
//  ThemeManager
//
//  Created by Andre Gustavo on 8/9/15.
//  Copyright (c) 2015 Andre Gustavo. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (instancetype) esp_colorFromHexString:(NSString *)hexString {
    
    unsigned int rgbValue = [self esp_unsignedIntFromHexString:hexString];
    
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                           green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
                            blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
                           alpha:1.0];
}

+ (unsigned int) esp_unsignedIntFromHexString:(NSString *)hexStr
{
    unsigned int hexInt = 0;
    
    NSScanner *scanner = [NSScanner scannerWithString:hexStr];
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    [scanner scanHexInt:&hexInt];

    return hexInt;
}

@end