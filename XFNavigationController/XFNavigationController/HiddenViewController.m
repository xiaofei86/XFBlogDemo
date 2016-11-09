//
//  HiddenViewController.m
//  XFNavigationController
//
//  Created by XuYafei on 16/4/14.
//  Copyright © 2016年 loopeer. All rights reserved.
//

#import "HiddenViewController.h"
#import "HiddenViewControllerTranslucent.h"
#import "UITableViewGenerator.h"

@implementation HiddenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UITableViewGenerator createRandomTableViewAtController:self didSelectedHandle:^(UITableView *tableView, NSIndexPath *indexPath) {
        [self.navigationController pushViewController:[HiddenViewControllerTranslucent new] animated:YES];
    } didScrollHandle:^(UIScrollView *tableView, CGPoint contentOffset) {}];
}

@end
