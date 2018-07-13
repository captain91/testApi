//
//  CMDeviceUtil.m
//  BSWebImage
//
//  Created by lee on 2018/6/1.
//  Copyright © 2018年 BS. All rights reserved.
//

#import "CMDeviceUtil.h"
#import <UIKit/UIKit.h>

static CMDeviceUtil *_instance = nil;
@implementation CMDeviceUtil

+ (instancetype)sharedDevice {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    
    return _instance;
}

- (NSString *)appName {
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appName = [infoDic objectForKey:@"CFBundleDisplayName"];
    return [appName copy];
}

- (NSString *)appVersion {
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
    return [appVersion copy];
}

- (NSString *)appBuildVersion {
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appBuildVersion = [infoDic objectForKey:@"CFBundleVersion"];
    return [appBuildVersion copy];
}
    
@end
