//
//  ESPThemeManagerTests.m
//  ThemeManager
//
//  Created by Andre Gustavo on 8/9/15.
//  Copyright (c) 2015 Andre Gustavo. All rights reserved.
//

@import Foundation;
@import XCTest;

#import "ESPThemeManager.h"

static ESPThemeManager *_defaultManager;

@interface ESPThemeManagerTests : XCTestCase

@end

@implementation ESPThemeManagerTests

- (void)setUp {
    [super setUp];
    
    NSBundle *testBundle = [NSBundle bundleForClass:[self class]];
	NSString *filePath = [testBundle pathForResource:@"index" ofType:@"json"];
    
    _defaultManager = [[ESPThemeManager alloc] initWithJSONFile:filePath];
}

- (void)tearDown {
    [super tearDown];
}

- (void) testInit {
    XCTAssertNotNil(_defaultManager);
}

- (void) testImage {
    XCTAssertThrows([_defaultManager themedImage:@"inexistent.image"]);
    XCTAssertThrows([_defaultManager themedImage:@"invalid.image"]);
//	Needs some changes to allow mocking
//    XCTAssertNotNil([_defaultManager themedImage:@"existent.image"]);
//    XCTAssertNotNil([_defaultManager themedImage:@"pre.definedImage"]);
}

- (void) testColor {
    XCTAssertThrows([_defaultManager themedColor:@"inexistent.color"]);
    XCTAssertThrows([_defaultManager themedColor:@"invalid.color"]);
    XCTAssertNotNil([_defaultManager themedColor:@"existent.color"]);
    XCTAssertNotNil([_defaultManager themedColor:@"pre.definedColor"]);
}

- (void) testFont {
    XCTAssertThrows([_defaultManager themedFont:@"inexistent.font"]);
    XCTAssertThrows([_defaultManager themedFont:@"invalid.font"]);
    XCTAssertNotNil([_defaultManager themedFont:@"existent.font"]);
    XCTAssertNotNil([_defaultManager themedFont:@"pre.definedFont"]);
}

@end