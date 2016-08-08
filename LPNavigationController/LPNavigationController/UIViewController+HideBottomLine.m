//
//  UIViewController+HideBottomLine.m
//  LPNavigationController
//
//  Created by 徐亚非 on 16/8/8.
//  Copyright © 2016年 loopeer. All rights reserved.
//

#import "UIViewController+HideBottomLine.h"

@implementation UIViewController (HideBottomLine)

- (void)hideBottomLineInView:(UIView *)view {
    UIImageView *navBarLineImageView = [self findLineImageViewUnder:view];
    navBarLineImageView.hidden = YES;
}

- (void)showBottomLineInView:(UIView *)view {
    UIImageView *navBarLineImageView = [self findLineImageViewUnder:view];
    navBarLineImageView.hidden = NO;
}

- (UIImageView *)findLineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findLineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

@end
