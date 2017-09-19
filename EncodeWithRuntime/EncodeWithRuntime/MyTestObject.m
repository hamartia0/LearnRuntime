//
//  MyTestObject.m
//  EncodeWithRuntime
//
//  Created by 赵白杨 on 2017/9/19.
//  Copyright © 2017年 赵白杨. All rights reserved.
//

#import "MyTestObject.h"

@implementation MyTestObject

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_officalName forKey:@"officalName"];
    [aCoder encodeInt:_amountOfNames forKey:@"amountOfNames"];
    [aCoder encodeObject:_aliasArr forKey:@"aliasArr"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.officalName = [aDecoder decodeObjectForKey:@"officalName"];
        self.amountOfNames = [aDecoder decodeIntForKey:@"amountOfNames"];
        self.aliasArr = [aDecoder decodeObjectForKey:@"aliasArr"];
    }
    return self;
}

@end
