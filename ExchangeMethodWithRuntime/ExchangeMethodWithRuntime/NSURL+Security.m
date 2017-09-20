//
//  NSURL+Security.m
//  ExchangeMethodWithRuntime
//
//  Created by 赵白杨 on 2017/9/20.
//  Copyright © 2017年 赵白杨. All rights reserved.
//

#import "NSURL+Security.h"

@implementation NSURL (Security)

+ (instancetype)HHY_URLWithString:(NSString *)str {
    NSURL *url = [NSURL URLWithString:str];
    if (url == nil) {
        NSLog(@"URL 为空");
        return nil;
    } else {
        return url;
    }
}

@end
