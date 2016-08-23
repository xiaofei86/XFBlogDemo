//
//  XFHTMLConfigurator.m
//  XFNewsContentDemo
//
//  Created by 徐亚非 on 16/8/24.
//  Copyright © 2016年 maxthon. All rights reserved.
//

#import "XFHTMLConfigurator.h"

@implementation XFHTMLConfigurator

+ (NSString *)connectToHTMLStringWith:(NSArray<XFContentFragmentModel *> *)fragmentModels {
    NSMutableString *htmlString = [NSMutableString string];
    for (XFContentFragmentModel *model in fragmentModels) {
        switch (model.type) {
            case XFContentFragmentTypeText: {
                [htmlString appendFormat:@"<p>%@</p>", model.value];
                break;
            } case XFContentFragmentTypeImage: {
                [htmlString appendFormat:@"<img src = '%@'>", model.value];
                break;
            } default: {
                break;
            }
        }
    }
    return htmlString;
}

+ (NSArray<XFContentFragmentModel *> *)breakHTMLFrom:(NSString *)htmlString {
    return [NSArray array];
}

@end
