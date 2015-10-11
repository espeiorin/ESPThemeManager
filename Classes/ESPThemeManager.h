//
//  ESPThemeManager.h
//  ThemeManager
//
//  Created by Andre Gustavo on 8/9/15.
//  Copyright (c) 2015 Andre Gustavo. All rights reserved.
//

@import UIKit;

@interface ESPThemeManager : NSObject

- (instancetype) initWithJSONFile:(NSString *)jsonFile;

- (UIFont *) themedFont:(NSString *)fontPath;
- (UIColor *) themedColor:(NSString *)colorPath;
- (UIImage *) themedImage:(NSString *)imagePath;

@end