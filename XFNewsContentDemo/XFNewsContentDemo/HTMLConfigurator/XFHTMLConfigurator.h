//
//  XFHTMLConfigurator.h
//  XFNewsContentDemo
//
//  Created by 徐亚非 on 16/8/24.
//  Copyright © 2016年 maxthon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFContentFragmentModel.h"

@interface XFHTMLConfigurator : NSObject

+ (NSString *)connectToHTMLStringWith:(NSArray<XFContentFragmentModel *> *)fragmentModels;

+ (NSArray<XFContentFragmentModel *> *)breakHTMLFrom:(NSString *)htmlString;

@end
