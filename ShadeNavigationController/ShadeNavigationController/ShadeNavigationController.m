//
//  ShadeNavigationController.m
//  ShadeNavigationController
//
//  Created by babywolf on 16/3/11.
//  Copyright © 2016年 com.babywolf. All rights reserved.
//

#import "ShadeNavigationController.h"

@interface ShadeNavigationController ()

@end

@implementation ShadeNavigationController

- (void)setNavigationBarColor:(UIColor *)navigationBarColor {
    _shadeNavigationBar.backgroundColor = navigationBarColor;
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
    _shadeNavigationBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 164)];
    UIColor *color = [UIColor blackColor];
    if (self.navigationBarColor) {
        color = self.navigationBarColor;
    }
    _shadeNavigationBar.backgroundColor = color;
    [self.view addSubview:_shadeNavigationBar];
}

- (void)changeNavigationBarWithscale:(CGFloat)scale {
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, (164-64)*scale+64);
    _shadeNavigationBar.frame = rect;
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
