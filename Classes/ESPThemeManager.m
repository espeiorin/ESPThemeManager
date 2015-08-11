//
//  ESPThemeManager.m
//  ThemeManager
//
//  Created by Andre Gustavo on 8/9/15.
//  Copyright (c) 2015 Andre Gustavo. All rights reserved.
//

#import "ESPThemeManager.h"
#import "UIColor+Hex.h"

@interface ESPThemeManager ()

@property (nonatomic, copy) NSBundle *bundle;
@property (nonatomic, strong) NSDictionary *themeData;
@property (nonatomic, strong) NSDictionary *variables;

@end

@implementation ESPThemeManager

- (instancetype) initWithBundle:(NSBundle *)bundle {
    
    NSAssert(bundle, @"Bundle Object must not be nil");
    
    self = [super init];
    
    if (!self) {
        return nil;
    }
    
    _bundle = bundle;
    
    [self loadBundle];
    
    return self;
}

- (void) loadBundle {
    NSString *jsonPath = [_bundle pathForResource:@"index" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    
    NSAssert(jsonData, @"Invalid JSON index file");
    
    NSError *parseError;
    _themeData = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&parseError];
    
    NSAssert(!parseError, @"Invalid JSON data");
    
    _variables = _themeData[@"defined"];
}

- (UIFont *) themedFont:(NSString *)fontPath {
    
    NSAssert(fontPath, @"Font Path must not be nil");
    
    NSArray *fontData = [self.themeData valueForKeyPath:fontPath];
    
    if ([fontData isKindOfClass:[NSString class]]) {
        fontData = self.variables[fontData];
    }
    
    NSAssert(fontData, @"You must request a valid font path");
    NSAssert(fontData.count == 2, @"Invalid font data");
    
    return [UIFont fontWithName:fontData[0] size:[fontData[1] floatValue]];;
}

- (UIColor *) themedColor:(NSString *)colorPath {
    
    NSAssert(colorPath, @"Color Path must not be nil");
    
    NSArray *colorData = [self.themeData valueForKeyPath:colorPath];
    
    if ([colorData isKindOfClass:[NSString class]]) {
        colorData = self.variables[colorData];
    }
    
    NSAssert(colorData, @"You must request a valid color path");
    NSAssert(colorData.count == 2, @"Invalid color data");
    
    NSString *color = colorData[0];
    CGFloat alpha = [colorData[1] doubleValue];
    return [[UIColor esp_colorFromHexString:color] colorWithAlphaComponent:alpha];
}

- (UIImage *) themedImage:(NSString *)imagePath {
    
    NSAssert(imagePath, @"Image Path must not be nil");
    
    NSArray *imageData = [self.themeData valueForKeyPath:imagePath];
    
    if ([imageData isKindOfClass:[NSString class]]) {
        imageData = self.variables[imageData];
    }
    
    NSAssert(imageData, @"You must request a valid image path");
    NSAssert(imageData.count == 2, @"Invalid image data");
    
    NSString *filePath = [self.bundle pathForResource:imageData[0] ofType:imageData[1]];
    
    NSAssert(filePath, @"Invalid image file path");

    return [UIImage imageWithContentsOfFile:filePath];
}

@end