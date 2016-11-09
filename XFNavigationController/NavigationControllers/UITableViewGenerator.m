//
//  UITableViewGenerator.m
//  XFNavigationController
//
//  Created by XuYafei on 16/4/13.
//  Copyright © 2016年 loopeer. All rights reserved.
//

#import "UITableViewGenerator.h"

static NSMutableArray *_array;

@interface UITableViewGenerator () <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@end

@implementation UITableViewGenerator {
    SelectedHandle _selectedHandle;
    ScrollHandle _scrollHandle;
    CGFloat refrenceRed;
    CGFloat refrenceGreen;
    CGFloat refrenceBlue;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        refrenceRed = (arc4random() % 255) / 255.0;
        refrenceGreen = (arc4random() % 255) / 255.0;
        refrenceBlue = (arc4random() % 255) / 255.0;
    }
    return self;
}

+ (void)initialize {
    _array = [NSMutableArray array];
}

+ (instancetype)shareInstance {
    id instance = [self new];
    [_array addObject:instance];
    return instance;
}

+ (UITableView *)createRandomTableViewAtController:(UIViewController *)controller
                                 didSelectedHandle:(SelectedHandle)selectedHandle
                                   didScrollHandle:(ScrollHandle)scrollHandle {
    UITableViewGenerator *generator = [self shareInstance];
    generator->_selectedHandle = selectedHandle;
    generator->_scrollHandle = scrollHandle;
    UITableView *tableView = [[UITableView alloc] initWithFrame:controller.view.bounds style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = generator;
    tableView.dataSource = generator;
    tableView.rowHeight = 44;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    [controller.view addSubview:tableView];
    return tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    NSInteger offset = 40;
    CGFloat red = (int)(arc4random() % (offset * 2) - offset) / 255.0 + refrenceRed;
    CGFloat green = (int)(arc4random() % (offset * 2) - offset) / 255.0 + refrenceGreen;
    CGFloat blue = (int)(arc4random() % (offset * 2) - offset) / 255.0 + refrenceBlue;
    cell.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    _selectedHandle(tableView, indexPath);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    _scrollHandle(scrollView, scrollView.contentOffset);
}

@end
