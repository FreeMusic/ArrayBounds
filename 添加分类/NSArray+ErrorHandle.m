//
//  NSArray+ErrorHandle.m
//  数组越界
//
//  Created by mic on 2017/12/25.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "NSArray+ErrorHandle.h"

@implementation NSArray (ErrorHandle)
/**
 *  防止数组越界
 */
- (id)arrayObjectAtIndex:(NSUInteger)index{
    if (index < self.count) {
        return [self objectAtIndex:index];
    }else{
        return nil;
    }
}

@end

