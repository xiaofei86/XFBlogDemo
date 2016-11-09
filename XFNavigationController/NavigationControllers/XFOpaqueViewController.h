//
//  XFOpaqueViewController.h
//  XFNavigationController
//
//  Created by XuYafei on 16/4/14.
//  Copyright © 2016年 loopeer. All rights reserved.
//

#import "XFBaseViewController.h"

@interface XFOpaqueViewController : XFBaseViewController

@property (nonatomic, strong) UINavigationBar *navigationBar;

- (BOOL)isTranslucent;

@end
