//
//  NSURL+Security.m
//  ExchangeMethodWithRuntime
//
//  Created by 赵白杨 on 2017/9/20.
//  Copyright © 2017年 赵白杨. All rights reserved.
//

#import "NSURL+Security.h"
#import <objc/message.h>

@implementation NSURL (Security)

+ (void)load {
    
    Method oldMethod = class_getClassMethod([NSURL class], @selector(URLWithString:));
    Method newMethod = class_getClassMethod([NSURL class], @selector(HHY_URLWithString:));
    
    method_exchangeImplementations(oldMethod, newMethod);
}

+ (instancetype)HHY_URLWithString:(NSString *)str {
    NSURL *url = [NSURL HHY_URLWithString:str];
    if (url == nil) {
        NSLog(@"URL 为空");
        return nil;
    } else {
        return url;
    }
}

@end
