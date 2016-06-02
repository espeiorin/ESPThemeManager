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

@property (nonnull, nonatomic, strong) NSString *themeFile;
@property (nonnull, nonatomic, strong) NSDictionary *themeData;
@property (nonnull, nonatomic, strong) NSDictionary *variables;

@end

@implementation ESPThemeManager

- (nullable instancetype) initWithJSONFile:(nonnull NSString *)jsonFile {
    
    NSAssert(jsonFile, @"JSONFile must not be nil");
    
    self = [super init];
    
    if (!self) {
        return nil;
    }
    
    _themeFile = jsonFile;
    
    [self loadBundle];
    
    return self;
}

- (void) loadBundle {
    NSData *jsonData = [NSData dataWithContentsOfFile:self.themeFile];
    NSAssert(jsonData, @"Invalid JSON index file, it must contain the complete file path");
    
    NSError *parseError;
    _themeData = [NSJSONSerialization JSONObjectWithData:jsonData
                                                 options:NSJSONReadingAllowFragments
                                                   error:&parseError];
    
    NSAssert(!parseError, @"Invalid JSON data");
    
    _variables = _themeData[@"defined"];
}

- (nonnull UIFont *) themedFont:(nonnull NSString *)fontPath {
	
    NSArray *fontData = [self.themeData valueForKeyPath:fontPath];
    
    if ([fontData isKindOfClass:[NSString class]]) {
        fontData = self.variables[fontData];
    }
    
    NSAssert(fontData, @"You must request a valid font path");
    NSAssert(fontData.count == 2, @"Invalid font data");
    
    return [UIFont fontWithName:fontData[0] size:[fontData[1] floatValue]];;
}

- (nonnull UIColor *) themedColor:(nonnull NSString *)colorPath {
    
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

- (nonnull UIImage *) themedImage:(nonnull NSString *)imagePath {
    
    NSString *imageName = [self.themeData valueForKeyPath:imagePath];
	NSAssert(imageName.length > 0, @"You must request a valid image path");
	
	if (self.variables[imageName] != nil) {
		imageName = self.variables[imageName];
	}

    return [UIImage imageNamed:imageName];
}

@end