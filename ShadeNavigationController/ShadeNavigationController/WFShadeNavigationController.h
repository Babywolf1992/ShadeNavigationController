//
//  WFShadeNavigationController.h
//  ShadeNavigationController
//
//  Created by babywolf on 16/3/11.
//  Copyright © 2016年 com.babywolf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WFShadeNavigationController : UINavigationController

@property (nonatomic, strong) UIView *shadeNavigationBar;
@property (nonatomic, strong) UIColor *navigationBarColor;

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController navigationBarColor:(UIColor *)color;

- (void)changeNavigationBarWithscale:(CGFloat)scale;

@end
