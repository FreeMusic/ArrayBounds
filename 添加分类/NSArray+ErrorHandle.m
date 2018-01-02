//
//  NSArray+ErrorHandle.m
//  数组越界
//
//  Created by mic on 2017/12/25.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "NSArray+ErrorHandle.h"
#import <objc/runtime.h>
#import "NSObject+SwizzleMethod.h"

@implementation NSArray (ErrorHandle)
/**
 *  防止数组越界
 */
- (id)objectAtIndexVerify:(NSUInteger)index{
    if (index < self.count) {
        return [self objectAtIndex:index];
    }else{
        return nil;
    }
}
/**
 *  防止数组越界
 */
- (id)objectAtIndexedSubscriptVerify:(NSUInteger)idx{
    if (idx < self.count) {
        return [self objectAtIndexedSubscript:idx];
    }else{
        return nil;
    }
}

+(void)load{
    [super load];
    //无论怎样 都要保证方法只交换一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //交换NSArray中的objectAtIndex方法
        [objc_getClass("__NSArrayI") SystemSelector:@selector(objectAtIndex:) swizzledSelector:@selector(sxy_objectAtIndex:) error:nil];
        //交换NSArray中的objectAtIndexedSubscript方法
        [objc_getClass("__NSArrayI") SystemSelector:@selector(objectAtIndexedSubscript:) swizzledSelector:@selector(sxy_objectAtIndexedSubscript:) error:nil];
    });
}

- (id)sxy_objectAtIndexedSubscript:(NSUInteger)idx{
    if (idx < self.count) {
        return [self sxy_objectAtIndexedSubscript:idx];
    }else{
        NSLog(@" 你的 NSArray数组已经越界了 但是已经帮你处理好了  %ld   %ld", idx, self.count);
        return nil;
    }
}

- (id)sxy_objectAtIndex:(NSUInteger)index{
    if (index < self.count) {
        return [self sxy_objectAtIndex:index];
    }else{
        NSLog(@" 你的 NSArray数组已经越界了 但是已经帮你处理好了  %ld   %ld", index, self.count);
        
        return nil;
    }
}

@end
