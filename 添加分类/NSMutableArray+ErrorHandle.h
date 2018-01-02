//
//  NSMutableArray+ErrorHandle.h
//  数组越界
//
//  Created by mic on 2017/12/26.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (ErrorHandle)
/**
 数组中插入数据

 @param object 数据
 @param index 下标
 */
- (void)insertObjectVerify:(id)object atIndex:(NSInteger)index;
/**
 数组中添加数据

 @param object 数据
 */
- (void)addObjectVerify:(id)object;

@end
