//
//  OpaqueViewControllerTranslucent.m
//  XFNavigationController
//
//  Created by XuYafei on 16/4/14.
//  Copyright © 2016年 loopeer. All rights reserved.
//

#import "OpaqueViewController.h"
#import "OpaqueViewControllerTranslucent.h"
#import "UITableViewGenerator.h"

@implementation OpaqueViewControllerTranslucent {
    UITableView *_tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [UITableViewGenerator createRandomTableViewAtController:self didSelectedHandle:^(UITableView *tableView, NSIndexPath *indexPath) {
        [self.navigationController pushViewController:[OpaqueViewController new] animated:YES];
    } didScrollHandle:^(UIScrollView *scrollView, CGPoint contentOffset) {
        self.navigationBar.alpha = contentOffset.y / 100;
    }];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _tableView.contentInset = UIEdgeInsetsZero;
}

- (BOOL)isTranslucent {
    return YES;
}

@end
