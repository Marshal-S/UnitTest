//
//  Store.m
//  UniTest
//
//  Created by Marshal on 2021/6/1.
//

#import "Store.h"

@implementation Store

+ (NSInteger)plus:(NSInteger)a with:(NSInteger)b {
    return a + b;
}

+ (void)loadData:(void(^)(id data))block {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        block(@"啦啦啦");
    });
}

+ (void)loop {
    for (NSInteger i = 0; i < 100000000; i++) {
        [self plus:i with:i];
    }
}

@end
