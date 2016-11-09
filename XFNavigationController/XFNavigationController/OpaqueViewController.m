//
//  OpaqueViewController.m
//  XFNavigationController
//
//  Created by XuYafei on 16/4/14.
//  Copyright © 2016年 loopeer. All rights reserved.
//

#import "OpaqueViewController.h"
#import "OpaqueViewControllerTranslucent.h"
#import "UITableViewGenerator.h"

@implementation OpaqueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UITableViewGenerator createRandomTableViewAtController:self didSelectedHandle:^(UITableView *tableView, NSIndexPath *indexPath) {
        [self.navigationController pushViewController:[OpaqueViewControllerTranslucent new] animated:YES];
    } didScrollHandle:^(UIScrollView *tableView, CGPoint contentOffset) {}];
}

@end
