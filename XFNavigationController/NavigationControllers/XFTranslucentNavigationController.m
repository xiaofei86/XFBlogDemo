//
//  XFTranslucentNavigationController.m
//  XFNavigationController
//
//  Created by XuYafei on 16/4/14.
//  Copyright © 2016年 loopeer. All rights reserved.
//

#import "XFTranslucentViewController.h"
#import "XFTranslucentNavigationController.h"
#import "UIViewController+HideBottomLine.h"

@interface XFTranslucentNavigationController () <UINavigationControllerDelegate>

@end

@implementation XFTranslucentNavigationController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self hideBottomLineInView:self.navigationBar];
    }
    return self;
}

- (void)pushViewController:(XFTranslucentViewController *)viewController animated:(BOOL)animated {
    XFTranslucentViewController *currentVC = self.viewControllers.lastObject;
    if (![viewController useTransparentNavigationBar] && ![currentVC useTransparentNavigationBar]) {
        self.shouldAddFakeNavigationBar = NO;
    } else {
        self.shouldAddFakeNavigationBar = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    XFTranslucentViewController *previousVC = self.viewControllers[self.viewControllers.count - 2];
    XFTranslucentViewController *currentVC = self.viewControllers.lastObject;
    if (![currentVC useTransparentNavigationBar] && ![previousVC useTransparentNavigationBar]) {
        self.shouldAddFakeNavigationBar = NO;
    } else {
        self.shouldAddFakeNavigationBar = YES;
    }
    return [super popViewControllerAnimated:animated];
}

@end
