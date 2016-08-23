//
//  XFNewsContentModel.h
//  XFNewsContentDemo
//
//  Created by 徐亚非 on 16/8/19.
//  Copyright © 2016 www.maxthon.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFContentFragmentModel.h"

@interface XFNewsContentModel : NSObject

@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *sourceURL;
@property (nonatomic, copy) NSString *createdAt;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, strong) NSArray<XFContentFragmentModel *> *fragmentModels;

@end
