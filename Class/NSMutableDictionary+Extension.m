//
//  NSMutableDictionary+Extension.m
//  TairanTV
//
//  Created by mengai on 2017/3/27.
//  Copyright © 2017年 Hangzhou Tairan. All rights reserved.
//

#import "NSMutableDictionary+Extension.h"

@implementation NSMutableDictionary (Extension)

- (void)setNotNullObject:(id)anObject forKey:(NSString *)aKey
{
    if (aKey == nil || aKey.length == 0) {
        return;
    }
    
    if (anObject == nil) {
        return;
    }
    [self setObject:anObject forKey:aKey];
}

@end
