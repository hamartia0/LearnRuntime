//
//  FakeObserver.m
//  KVOTechniqueDetail
//
//  Created by 赵白杨 on 2017/9/20.
//  Copyright © 2017年 赵白杨. All rights reserved.
//

#import "FakeObserver.h"

@implementation FakeObserver

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"通过context跳转到了父类来处理");
}

@end
