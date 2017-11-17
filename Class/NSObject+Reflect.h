//
//  NSObject+Reflect.h
//  ZFP_iPhone
//
//  Created by songzhanglong on 13-10-14.
//  Copyright (c) 2013年 chinasoftinc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Reflect)


/**
 *	根据属性名自动给对象赋值
 *
 *	@param 	dataSource 	数据源
 *
 *	@return	是否成功赋值
 */
- (BOOL)reflectDataFromOtherObject:(NSObject *)dataSource;

@end
