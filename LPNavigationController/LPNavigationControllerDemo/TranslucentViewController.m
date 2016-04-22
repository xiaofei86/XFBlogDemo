//
//  TranslucentViewController.m
//  LPNavigationController
//
//  Created by XuYafei on 16/4/14.
//  Copyright © 2016年 loopeer. All rights reserved.
//

#import "TranslucentViewController.h"
#import "TranslucentViewControllerTranslucent.h"
#import "UITableViewGenerator.h"

@implementation TranslucentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UITableViewGenerator createRandomTableViewAtController:self didSelectedHandle:^(UITableView *tableView, NSIndexPath *indexPath) {
        [self.navigationController pushViewController:[TranslucentViewControllerTranslucent new] animated:YES];
    } didScrollHandle:^(UIScrollView *tableView, CGPoint contentOffset) {}];
}

@end
