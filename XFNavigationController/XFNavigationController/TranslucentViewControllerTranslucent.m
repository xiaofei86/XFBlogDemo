//
//  TranslucentViewControllerTranslucent.m
//  XFNavigationController
//
//  Created by XuYafei on 16/4/14.
//  Copyright © 2016年 loopeer. All rights reserved.
//

#import "TranslucentViewController.h"
#import "TranslucentViewControllerTranslucent.h"
#import "UITableViewGenerator.h"

@implementation TranslucentViewControllerTranslucent {
    UITableView *_tableView;
}

//- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        self.navigationItem.title = @"TranslucentViewController";
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [UITableViewGenerator createRandomTableViewAtController:self didSelectedHandle:^(UITableView *tableView, NSIndexPath *indexPath) {
        [self.navigationController pushViewController:[TranslucentViewController new] animated:YES];
    } didScrollHandle:^(UIScrollView *tableView, CGPoint contentOffset) {}];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _tableView.contentInset = UIEdgeInsetsZero;
}

- (BOOL)useTransparentNavigationBar {
    return YES;
}

@end
