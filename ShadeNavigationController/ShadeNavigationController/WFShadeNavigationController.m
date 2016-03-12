//
//  WFShadeNavigationController.m
//  ShadeNavigationController
//
//  Created by babywolf on 16/3/11.
//  Copyright © 2016年 com.babywolf. All rights reserved.
//

#import "WFShadeNavigationController.h"

@interface WFShadeNavigationController ()

@end

@implementation WFShadeNavigationController

- (void)setNavigationBarColor:(UIColor *)navigationBarColor {
    _navigationBarColor = navigationBarColor;
    _shadeNavigationBar.backgroundColor = navigationBarColor;
}

- (void)setNumber:(int)number {
    _number = number;
    [self initShadeNavigationBar];
}

- (UIView *)shadeNavigationBar {
    if (!_shadeNavigationBar) {
        _shadeNavigationBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, kMaxHeight)];
    }
    return _shadeNavigationBar;
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController navigationBarColor:(UIColor *)color {
    if (self = [super initWithRootViewController:rootViewController]) {
        self.navigationBarColor = color;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.hidden = YES;
    
    [self initShadeNavigationBar];
}

- (void)initShadeNavigationBar {
    UIColor *color = [UIColor blackColor];
    if (self.navigationBarColor) {
        color = self.navigationBarColor;
    }
    
    _shadeNavigationBar.backgroundColor = [UIColor clearColor];
    for (int i = 0; i < self.number; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, (kMaxHeight/self.number) * i, self.view.frame.size.width, kMaxHeight/self.number)];
        view.backgroundColor = color;
        view.tag = i+100;
        [_shadeNavigationBar addSubview:view];
    }
    [self.view addSubview:self.shadeNavigationBar];
}

- (void)changeNavigationBarWithscale:(CGFloat)scale {
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, (164-64)*scale+64);
    _shadeNavigationBar.frame = rect;
    for (int i = 0; i < self.number; i++) {
        if (scale > 0.5) {
            CGFloat currentscale = (scale - 0.5) * 2;
            UIView *view = [_shadeNavigationBar viewWithTag:i+100];
            CGRect rect = CGRectMake(0, (kMaxHeight/self.number) * i * scale, self.view.frame.size.width, kMaxHeight/self.number*currentscale);
            view.frame = rect;
        }else {
            CGFloat currentscale = 1 - (scale * 2);
            UIView *view = [_shadeNavigationBar viewWithTag:i+100];
            CGRect rect = CGRectMake(0, (kMixHeight/self.number) * i, self.view.frame.size.width, kMixHeight/self.number*currentscale);
            view.frame = rect;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
