//
//  NSMutableDictionary+SafeObject.m
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import "NSMutableDictionary+SafeObject.h"

@implementation NSMutableDictionary (SafeObject)

-(void)setSafeObject:(id)anObject forKey:(id<NSCopying>)aKey{
    //NSAssert(anObject!=nil, @"输入的值不能为空...");
    if (anObject != nil) {
       [self setObject:anObject forKey:aKey];
    }
}

@end
