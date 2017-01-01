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
        if (self.delegate && [self.delegate respondsToSelector:@selector(onClick:)]) {
            [self.delegate onClick:index];
        }
    });
}

- (void)onload {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(onload)]) {
            [self.delegate onload];
        }
    });
}

- (void)documentReadyStateComplete {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(documentReadyStateComplete)]) {
            [self.delegate documentReadyStateComplete];
        }
    });
}

@end
