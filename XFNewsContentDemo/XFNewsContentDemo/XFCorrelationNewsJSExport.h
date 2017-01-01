//
//  XFCorrelationNewsJSExport.h
//  XFNewsContentDemo
//
//  Created by 徐亚非 on 16/8/24.
//  Copyright © 2016年 maxthon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol XFWebViewExportDelegate <NSObject>

- (void)onClick:(NSInteger)index;
- (void)onload;
- (void)documentReadyStateComplete;

@end

@protocol XFCorrelationNewsJSExport <JSExport>

- (void)onClick:(NSInteger)index;
- (void)onload;
- (void)documentReadyStateComplete;

@end

@interface XFCorrelationNewsJSExport : NSObject <XFCorrelationNewsJSExport>

@property (nonatomic, weak) id<XFWebViewExportDelegate> delegate;

@end
