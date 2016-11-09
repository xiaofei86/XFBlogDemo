//
//  XFTranslucentViewController.m
//  XFNavigationController
//
//  Created by XuYafei on 16/4/14.
//  Copyright © 2016年 loopeer. All rights reserved.
//

#import "XFTranslucentViewController.h"
#import "XFTranslucentNavigationController.h"
#import "UIViewController+HideBottomLine.h"

@implementation XFTranslucentViewController {
    UINavigationBar *_bar;
}

- (void)addFakeNavBar {
    _bar = [[UINavigationBar alloc] init];
    if ([self useTransparentNavigationBar]) {
        [_bar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [self hideBottomLineInView:_bar];
        //[_bar setShadowImage:[UIImage new]];
    } else {
        [_bar setBackgroundImage:[UINavigationBar.appearance backgroundImageForBarMetrics:UIBarMetricsDefault] forBarMetrics:UIBarMetricsDefault];
        [self hideBottomLineInView:self.navigationController.navigationBar];
        [self showBottomLineInView:_bar];
        //[_bar setShadowImage:[UINavigationBar.appearance shadowImage]];
    }
    _bar.barStyle = UINavigationBar.appearance.barStyle;
    _bar.translucent = YES;
    [self.view addSubview:_bar];
    [_bar setFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 64)];
}

- (void)removeFakeNavBar {
    if (_bar.superview) {
        [_bar removeFromSuperview];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.userInteractionEnabled = NO;
    [self removeFakeNavBar];
    if (((XFTranslucentNavigationController *)self.navigationController).shouldAddFakeNavigationBar) {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [self hideBottomLineInView:self.navigationController.navigationBar];
        //[self.navigationController.navigationBar setShadowImage:[UIImage new]];
        [self addFakeNavBar];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.userInteractionEnabled = YES;
    if (![self useTransparentNavigationBar]) {
        self.navigationController.navigationBar.barStyle = UINavigationBar.appearance.barStyle;
        self.navigationController.navigationBar.translucent = YES;
        [self.navigationController.navigationBar setBackgroundImage:[UINavigationBar.appearance backgroundImageForBarMetrics:UIBarMetricsDefault] forBarMetrics:UIBarMetricsDefault];
        [self showBottomLineInView:self.navigationController.navigationBar];
        //[self.navigationController.navigationBar setShadowImage:[UINavigationBar.appearance shadowImage]];
    }
    [self removeFakeNavBar];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self removeFakeNavBar];
    if (((XFTranslucentNavigationController *)self.navigationController).shouldAddFakeNavigationBar) {
        [self addFakeNavBar];
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self removeFakeNavBar];
}

- (BOOL)useTransparentNavigationBar {
    return NO;
}

@end
