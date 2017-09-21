//
//  FakeSubObserver.m
//  KVOTechniqueDetail
//
//  Created by 赵白杨 on 2017/9/20.
//  Copyright © 2017年 赵白杨. All rights reserved.
//

#import "FakeSubObserver.h"

int contextForKVO;

@implementation FakeSubObserver

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (context == &contextForKVO) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    } else {
        NSString *oldValue = [change objectForKey:NSKeyValueChangeOldKey];
        NSString *newValue = [change objectForKey:NSKeyValueChangeNewKey];
        
        NSLog(@"Observed keyPath:%@ of object:%@ changed value from %@ to %@", keyPath, object, oldValue, newValue);
    }
}

@end
