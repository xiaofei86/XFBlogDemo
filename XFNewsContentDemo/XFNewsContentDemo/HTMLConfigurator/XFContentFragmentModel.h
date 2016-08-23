//
//  XFContentFragmentModel.h
//  XFNewsContentDemo
//
//  Created by 徐亚非 on 16/8/24.
//  Copyright © 2016年 maxthon. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, XFContentFragmentType) {
    XFContentFragmentTypeText,
    XFContentFragmentTypeImage
};

@interface XFContentFragmentModel : NSObject

@property (nonatomic, assign) XFContentFragmentType type;
@property (nonatomic, assign) NSString *value;

@end
