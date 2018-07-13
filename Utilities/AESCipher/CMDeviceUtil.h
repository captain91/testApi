//
//  CMDeviceUtil.h
//  BSWebImage
//
//  Created by lee on 2018/6/1.
//  Copyright © 2018年 BS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMDeviceUtil : NSObject

@property (nonatomic, copy, readonly) NSString *appName;
@property (nonatomic, copy, readonly) NSString *appVersion;
@property (nonatomic, copy, readonly) NSString *appBuildVersion;

+ (instancetype)sharedDevice;
    
@end
