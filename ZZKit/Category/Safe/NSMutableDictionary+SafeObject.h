//
//  NSMutableDictionary+SafeObject.h
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableDictionary (SafeObject)

-(void)setSafeObject:(id)anObject forKey:(id<NSCopying>)aKey;

@end

NS_ASSUME_NONNULL_END
