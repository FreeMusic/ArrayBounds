//
//  NSMutableArray+ErrorHandle.m
//  数组越界
//
//  Created by mic on 2017/12/26.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "NSMutableArray+ErrorHandle.h"

@implementation NSMutableArray (ErrorHandle)
/**
 *  数组中插入数据
 */
- (void)insertObjectVerify:(id)object atIndex:(NSInteger)index{
    if (index < self.count) {
        [self insertObject:object atIndex:index];
    }else{
        
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

@end
