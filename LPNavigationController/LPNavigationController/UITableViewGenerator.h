//
//  UITableViewGenerator.h
//  LPNavigationController
//
//  Created by XuYafei on 16/4/13.
//  Copyright © 2016年 loopeer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewGenerator : NSObject

typedef void(^SelectedHandle)(UITableView *tableView, NSIndexPath *indexPath);
typedef void(^ScrollHandle)(UIScrollView *scrollView, CGPoint contentOffset);

+ (UITableView *)createRandomTableViewAtController:(UIViewController *)controller
                                 didSelectedHandle:(SelectedHandle)selectedHandle
                                   didScrollHandle:(ScrollHandle)scrollHandle;

@end
