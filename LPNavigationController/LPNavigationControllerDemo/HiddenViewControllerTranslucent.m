//
//  HiddenViewControllerTranslucent.m
//  LPNavigationController
//
//  Created by XuYafei on 16/4/14.
//  Copyright © 2016年 loopeer. All rights reserved.
//

#import "HiddenViewController.h"
#import "HiddenViewControllerTranslucent.h"
#import "UITableViewGenerator.h"

@implementation HiddenViewControllerTranslucent {
    UITableView *_tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [UITableViewGenerator createRandomTableViewAtController:self didSelectedHandle:^(UITableView *tableView, NSIndexPath *indexPath) {
        [self.navigationController pushViewController:[HiddenViewController new] animated:YES];
    } didScrollHandle:^(UIScrollView *scrollView, CGPoint contentOffset) {
        self.navigationBar.alpha = contentOffset.y / 100;
    }];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _tableView.contentInset = UIEdgeInsetsZero;
}

@end
