//
//  MyTestObject.m
//  EncodeWithRuntime
//
//  Created by 赵白杨 on 2017/9/19.
//  Copyright © 2017年 赵白杨. All rights reserved.
//

#import "MyTestObject.h"
#import <objc/message.h>

@implementation MyTestObject

- (void)encodeWithCoder:(NSCoder *)aCoder {
//    [aCoder encodeObject:_officalName forKey:@"officalName"];
//    [aCoder encodeInt:_amountOfNames forKey:@"amountOfNames"];
//    [aCoder encodeObject:_aliasArr forKey:@"aliasArr"];
    
    unsigned int ivarCount = 0;
    
    Ivar *ivarList = class_copyIvarList([MyTestObject class], &ivarCount);
    
    for (int i = 0; i < ivarCount; i++) {
        Ivar ivar = ivarList[i];
        const char *ivarName = ivar_getName(ivar);
        NSString *ivarStr = [NSString stringWithUTF8String:ivarName];
        
        id value = [self valueForKey:ivarStr];
        [aCoder encodeObject:value forKey:ivarStr];
    }
    
    free(ivarList);
    
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
//        self.officalName = [aDecoder decodeObjectForKey:@"officalName"];
//        self.amountOfNames = [aDecoder decodeIntForKey:@"amountOfNames"];
//        self.aliasArr = [aDecoder decodeObjectForKey:@"aliasArr"];
        
        unsigned int ivarCount = 0;
        
        Ivar *ivarList = class_copyIvarList([MyTestObject class], &ivarCount);
        
        for (int i = 0; i < ivarCount; i++) {
            Ivar ivar = ivarList[i];
            const char *ivarName = ivar_getName(ivar);
            NSString *ivarStr = [NSString stringWithUTF8String:ivarName];
            
//            id value = [self valueForKey:ivarStr];
            [self setValue:[aDecoder decodeObjectForKey:ivarStr] forKey:ivarStr];
            
        }
        
        free(ivarList);
    }
    return self;
}

@end
