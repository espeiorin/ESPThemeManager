//
//  ViewController.m
//  ThemeManager
//
//  Created by Andre Gustavo on 8/9/15.
//  Copyright (c) 2015 Andre Gustavo. All rights reserved.
//

#import "ViewController.h"
#import "ESPThemeManager.h"

@interface ViewController ()

@property (nonatomic, strong) ESPThemeManager *themeManager;

@property (nonatomic, weak) IBOutlet UILabel *label;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.label.font = [self.themeManager themedFont:@"label.font"];
    self.label.textColor = [self.themeManager themedColor:@"label.color"];
    
    self.imageView.image = [self.themeManager themedImage:@"imageView.image"];
    
    self.button.titleLabel.font = [self.themeManager themedFont:@"button.font"];
    [self.button setTitleColor:[self.themeManager themedColor:@"button.normal.color"] forState:UIControlStateNormal];
    [self.button setTitleColor:[self.themeManager themedColor:@"button.highlighted.color"] forState:UIControlStateHighlighted];
    [self.button setTitleColor:[self.themeManager themedColor:@"button.selected.color"] forState:UIControlStateSelected];
    [self.button setTitleColor:[self.themeManager themedColor:@"button.disabled.color"] forState:UIControlStateDisabled];
}

- (ESPThemeManager *) themeManager {
    if (_themeManager) {
        return _themeManager;
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"TestTheme" ofType:@"bundle"];
    NSBundle *bundle = [[NSBundle alloc] initWithPath:path];
    _themeManager = [[ESPThemeManager alloc] initWithBundle:bundle];
    
    return _themeManager;
}

@end