//
//  UIColor+Hex.h
//  ThemeManager
//
//  Created by Andre Gustavo on 8/9/15.
//  Copyright (c) 2015 Andre Gustavo. All rights reserved.
//

@import UIKit;

@interface UIColor (Hex)

+ (nullable instancetype) esp_colorFromHexString:(nonnull NSString *)hexString;

@end