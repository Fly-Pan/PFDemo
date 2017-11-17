//
//  NSObject+Reflect.m
//  ZFP_iPhone
//
//  Created by songzhanglong on 13-10-14.
//  Copyright (c) 2013年 chinasoftinc. All rights reserved.
//

#import "NSObject+Reflect.h"
#import <objc/runtime.h>

@implementation NSObject (Reflect)


/**
 *	获取对象的所有属性
 *
 *	@return	数组－存放属性名
 */
- (NSArray *)propertyKeys
{
    unsigned int outCount;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    NSMutableArray *keys = [NSMutableArray arrayWithCapacity:outCount];
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        [keys addObject:propertyName];
//        [propertyName release];
    }
    
    free(properties);
    return keys;
}

/**
 *	根据属性名自动给对象赋值
 *
 *	@param 	dataSource 	数据源
 *
 *	@return	是否成功赋值
 */
- (BOOL)reflectDataFromOtherObject:(NSObject *)dataSource
{
    BOOL ret = NO;
    for (NSString *key in [self propertyKeys]) {
        if ([dataSource isKindOfClass:[NSDictionary class]]) {
            ret = ([dataSource valueForKey:key] == nil) ? NO : YES;
        }
        else
        {
            ret = [dataSource respondsToSelector:NSSelectorFromString(key)];
        }
        
        if (ret) {
            id propertyValue = [dataSource valueForKey:key];
            //该值不为NSNULL，并且也不为nil
            if (![propertyValue isKindOfClass:[NSNull class]] && propertyValue != nil) {
                [self setValue:propertyValue forKey:key];
            }
        }
        
    }
    
    return ret;
}

@end
