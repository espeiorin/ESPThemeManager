//
//  ESPThemeManager.h
//  ThemeManager
//
//  Created by Andre Gustavo on 8/9/15.
//  Copyright (c) 2015 Andre Gustavo. All rights reserved.
//

@import UIKit;

@interface ESPThemeManager : NSObject

- (nullable instancetype) initWithJSONFile:(nonnull NSString *)jsonFile;

- (nonnull UIFont *) themedFont:(nonnull NSString *)fontPath;
- (nonnull UIColor *) themedColor:(nonnull NSString *)colorPath;
- (nonnull UIImage *) themedImage:(nonnull NSString *)imagePath;

@end