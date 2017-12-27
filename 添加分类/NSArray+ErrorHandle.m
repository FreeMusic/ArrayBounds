//
//  NSArray+ErrorHandle.m
//  数组越界
//
//  Created by mic on 2017/12/25.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "NSArray+ErrorHandle.h"
#import <objc/runtime.h>

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
//+(void)load{
//    Method systemMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndexedSubscript:));
//    Method newMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndexVerify:));
////    Method
//
//    method_exchangeImplementations(systemMethod, newMethod);
//}
//
//- (id)objectAtIndexedSubscriptVerify:(NSUInteger)idx{
//    NSLog(@"%ld   %ld", idx, self.count);
//    if (idx < self.count) {
//        return [self objectAtIndexedSubscriptVerify:idx];
//    }else{
//        return nil;
//    }
//}

@end
