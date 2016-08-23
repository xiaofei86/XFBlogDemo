//
//  XFNewsListModel.m
//  XFNewsContentDemo
//
//  Created by 徐亚非 on 16/8/19.
//  Copyright © 2016 www.maxthon.com. All rights reserved.
//

#import "XFNewsListModel.h"

#define Minute 60
#define Hour 3600
#define Day 86400
#define Month 2592000
#define Year 31104000

@implementation XFNewsListModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"只有三星才能撑起Android大旗 不让iPhone一家独大";
        self.sourceURL = @"http://tech.china.com/news/prnasia/11082256/20160822/23344579.html";
        self.source = @"中华网";
        self.time = @(1471939859);
        self.image = @"http://img.mt.shequzhidahao.com:3004/hello?id=7842416559710287791";
        //http://img.mt.shequzhidahao.com:3004/hello?id=7842416559710287791   170*112
        //http://img.mt.shequzhidahao.com:3004/hello?id=7842416559710287792   640*360
        //http://img.mt.shequzhidahao.com:3004/hello?id=784241655971028779    600*337
    }
    return self;
}

- (NSString *)displayTime {
    NSTimeInterval timeInterval = [_time doubleValue];
    return [XFNewsListModel stringFromTimeInterval:timeInterval];
}

+ (NSString *)stringFromTimeInterval:(NSTimeInterval)timeInterval {
    NSTimeInterval interval = [NSDate date].timeIntervalSince1970 - timeInterval;
    if (interval < 60) {
        return NSLocalizedString(@"刚刚", nil);
    } else if (interval >= Minute && interval < Minute * 10) {
        NSString *string = NSLocalizedString(@"分钟前", nil);
        return [NSString stringWithFormat:@"%.0f%@", floor(interval / Minute), string];
    } else if (interval >= Minute * 10 && interval < Hour) {
        NSString *string = NSLocalizedString(@"分钟前", nil);
        return [NSString stringWithFormat:@"%.0f%@", 10 * floor(interval / (Minute * 10)), string];
    } else if (interval >= Hour && interval < Day) {
        NSString *string = NSLocalizedString(@"小时前", nil);
        return [NSString stringWithFormat:@"%.0f%@", floor(interval / Hour), string];
    } else if (interval >= Day && interval < Month) {
        NSString *string = NSLocalizedString(@"天前", nil);
        return [NSString stringWithFormat:@"%.0f%@", floor(interval / Day), string];
    } else if (interval >= Month && interval < Year) {
        NSString *string = NSLocalizedString(@"个月前", nil);
        return [NSString stringWithFormat:@"%.0f%@", floor(interval / Month), string];
    } else {
        NSString *string = NSLocalizedString(@"年前", nil);
        return [NSString stringWithFormat:@"%.0f%@", floor(interval / Year), string];
    }
}

@end
