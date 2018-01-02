//
//  NSMutableArray+ErrorHandle.m
//  数组越界
//
//  Created by mic on 2017/12/26.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "NSMutableArray+ErrorHandle.h"
#import "NSObject+SwizzleMethod.h"
#import <objc/runtime.h>

@implementation NSMutableArray (ErrorHandle)
/**
 *  数组中插入数据
 */
- (void)insertObjectVerify:(id)object atIndex:(NSInteger)index{
    if (index < self.count && object) {
        [self insertObject:object atIndex:index];
    }
}
/**
 *  数组中添加数据
 */
- (void)addObjectVerify:(id)object{
    if (object) {
        [self addObject:object];
    }
}

+(void)load{
    [super load];
    //交换NSMutableArray中的方法
    [objc_getClass("__NSArrayM") SystemSelector:@selector(objectAtIndex:) swizzledSelector:@selector(jz_objectAtIndex:) error:nil];
    //交换NSMutableArray中的方法
    [objc_getClass("__NSArrayM") SystemSelector:@selector(objectAtIndexedSubscript:) swizzledSelector:@selector(jz_objectAtIndexedSubscript:) error:nil];
}

- (id)jz_objectAtIndex:(NSUInteger)index{
    if (index < self.count) {
        return [self jz_objectAtIndex:index];
    }else{
        return nil;
    }
}
- (id)jz_objectAtIndexedSubscript:(NSUInteger)index{
    NSLog(@" NSMutableArray数组越界处理 %ld   %ld   %@", index, self.count, [self class]);
    if (index < self.count) {

        return [self jz_objectAtIndexedSubscript:index];
    }
    
    return nil;
}

@end
