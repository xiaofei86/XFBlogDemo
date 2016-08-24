//
//  XFCorrelationNewsJSExport.m
//  XFNewsContentDemo
//
//  Created by 徐亚非 on 16/8/24.
//  Copyright © 2016年 maxthon. All rights reserved.
//

#import "XFCorrelationNewsJSExport.h"
#import "ViewController.h"

@implementation XFCorrelationNewsJSExport

- (void)onClick:(NSInteger)index {
    dispatch_async(dispatch_get_main_queue(), ^{
        ViewController *vc = [ViewController new];
        [_viewController.navigationController pushViewController:vc animated:YES];
    });
}

- (void)dealloc {
    
}

@end
