//
//  NSArray+ErrorHandle.h
//  数组越界
//
//  Created by mic on 2017/12/25.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (ErrorHandle)

/**
 为数组分类添加的方法  可以在应用中直接调用 可以防止数组越界导致的crash

 @param index 传入的取值下标
 @return id类型的数据
 */
- (id)objectAtIndexVerify:(NSUInteger)index;
- (id)objectAtIndexedSubscriptVerify:(NSUInteger)idx;

@end
