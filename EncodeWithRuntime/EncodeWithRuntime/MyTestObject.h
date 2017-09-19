//
//  MyTestObject.h
//  EncodeWithRuntime
//
//  Created by 赵白杨 on 2017/9/19.
//  Copyright © 2017年 赵白杨. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyTestObject : NSObject<NSCoding>

/** 名称*/
@property (nonatomic, copy) NSString *officalName;

/** 姓名个数*/
@property (assign, nonatomic) int amountOfNames;

/** 昵称数组*/
@property (strong, nonatomic) NSArray *aliasArr;

@end
