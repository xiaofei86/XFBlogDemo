//
//  ViewController.m
//  XFNavigationController
//
//  Created by 徐亚非 on 2016/10/28.
//  Copyright © 2016年 XuYafei. All rights reserved.
//


#import "ViewController.h"
#import "TranslucentViewController.h"
#import "UITableViewGenerator.h"

@implementation ViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.title = NSStringFromClass([self class]);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [UITableViewGenerator createRandomTableViewAtController:self didSelectedHandle:^(UITableView *tableView, NSIndexPath *indexPath) {
        ViewController *vc = [ViewController new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    } didScrollHandle:^(UIScrollView *tableView, CGPoint contentOffset) {}];
}

@end
