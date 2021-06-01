//
//  Store.h
//  UniTest
//
//  Created by Marshal on 2021/6/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Store : NSObject

+ (NSInteger)plus:(NSInteger)a with:(NSInteger)b;

+ (void)loadData:(void(^)(id data))block;

+ (void)loop;

@end

NS_ASSUME_NONNULL_END
