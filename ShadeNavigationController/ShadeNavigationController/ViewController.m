//
//  ViewController.m
//  ShadeNavigationController
//
//  Created by babywolf on 16/3/11.
//  Copyright © 2016年 com.babywolf. All rights reserved.
//

#import "ViewController.h"
#import "ShadeNavigationController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*3);
    [self.view addSubview:_scrollView];
    _scrollView.delegate = self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%f,%f",scrollView.contentOffset.x,scrollView.contentOffset.y);
    CGFloat scale = (100 - scrollView.contentOffset.y) / 100;
    if (scale >1) {
        scale = 1;
    }else if (scale < 0) {
        scale = 0;
    }
    ShadeNavigationController *navigationCtrl = (ShadeNavigationController *)self.navigationController;
    [navigationCtrl changeNavigationBarWithscale:scale];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
