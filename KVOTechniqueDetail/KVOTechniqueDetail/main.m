//
//  main.m
//  KVOTechniqueDetail
//
//  Created by 赵白杨 on 2017/9/20.
//  Copyright © 2017年 赵白杨. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FakeSubObserver.h"

@interface FakeLogger : NSObject

@property (strong, nonatomic) NSDate *lastTime;
- (NSString *)lastTimeString;
- (void)updateLastTime:(NSTimer *)t;

@end

@implementation FakeLogger

- (NSString *)lastTimeString {
    NSDateFormatter *dateFormat = [NSDateFormatter new];
    [dateFormat setDateStyle:NSDateFormatterMediumStyle];
    [dateFormat setTimeStyle:NSDateFormatterMediumStyle];
    
    return [dateFormat stringFromDate:_lastTime];
}

- (void)updateLastTime:(NSTimer *)t {
    NSDate *now = [NSDate date];
//    [self setLastTime:now];
    [self willChangeValueForKey:@"lastTime"];
    _lastTime = now;
    [self didChangeValueForKey:@"lastTime"];
    NSLog(@"Just set time to %@", self.lastTimeString);
}

+ (NSSet<NSString *> *)keyPathsForValuesAffectingLastTimeString {
    return [NSSet setWithObject:@"lastTime"];
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        FakeLogger *logger = [FakeLogger new];
        
        __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:5.0f target:logger selector:@selector(updateLastTime:) userInfo:nil repeats:YES];
        
        FakeSubObserver *observer = [FakeSubObserver new];
        [logger addObserver:observer forKeyPath:@"lastTimeString" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:&contextForKVO];
        
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
