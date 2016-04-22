//
//  LPOpaqueViewController.h
//  LPNavigationController
//
//  Created by XuYafei on 16/4/14.
//  Copyright © 2016年 loopeer. All rights reserved.
//

#import "LPBaseViewController.h"

@interface LPOpaqueViewController : LPBaseViewController

@property (nonatomic, strong) UINavigationBar *navigationBar;

- (BOOL)isTranslucent;

@end
