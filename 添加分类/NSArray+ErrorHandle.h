//
//  NSArray+ErrorHandle.h
//  数组越界
//
//  Created by mic on 2017/12/25.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (ErrorHandle)
//防止数组越界
- (id)objectAtIndexVerify:(NSUInteger)index;

- (id)objectAtIndexedSubscriptVerify:(NSUInteger)idx;

@end
