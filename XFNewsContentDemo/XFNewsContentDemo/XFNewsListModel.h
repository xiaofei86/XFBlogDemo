//
//  XFNewsListModel.h
//  XFNewsContentDemo
//
//  Created by 徐亚非 on 16/8/19.
//  Copyright © 2016 www.maxthon.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XFNewsListModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSNumber *time;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *sourceURL;

@property (nonatomic, weak, readonly) NSString *displayTime;

+ (NSString *)stringFromTimeInterval:(NSTimeInterval)timeInterval;

@end
