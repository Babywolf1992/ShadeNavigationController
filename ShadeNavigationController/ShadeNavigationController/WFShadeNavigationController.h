//
//  WFShadeNavigationController.h
//  ShadeNavigationController
//
//  Created by babywolf on 16/3/11.
//  Copyright © 2016年 com.babywolf. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kMaxHeight 200
#define kMixHeight 64

@interface WFShadeNavigationController : UINavigationController

@property (nonatomic, strong) UIView *shadeNavigationBar;
@property (nonatomic, strong) UIColor *navigationBarColor;
@property (nonatomic, assign) int number;

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController navigationBarColor:(UIColor *)color;

- (void)changeNavigationBarWithscale:(CGFloat)scale;

@end
