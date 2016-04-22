//
//  LPOpaqueViewController.m
//  LPNavigationController
//
//  Created by XuYafei on 16/4/14.
//  Copyright © 2016年 loopeer. All rights reserved.
//

#import "LPOpaqueViewController.h"

@implementation LPOpaqueViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 64)];
        if ([self isTranslucent]) {
            _navigationBar.alpha = 0;
        }
        [self.view addSubview:_navigationBar];
    }
    return self;
}

- (void)viewDidLayoutSubviews {
    [self.view bringSubviewToFront:_navigationBar];
}

- (BOOL)isTranslucent {
    return NO;
}

@end
