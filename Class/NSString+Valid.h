/************************************************************
 *  * EaseMob CONFIDENTIAL
 * __________________
 * Copyright (C) 2013-2014 EaseMob Technologies. All rights reserved.
 *
 * NOTICE: All information contained herein is, and remains
 * the property of EaseMob Technologies.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from EaseMob Technologies.
 */

#import <Foundation/Foundation.h>

@interface NSString (Valid)
-(BOOL)isChinese;
+(NSString*)DataTOjsonString:(id)object;
-(NSString *)md5HexDigest:(NSString*)input;
+(NSString *)imageNameWithtype:(NSInteger)type;
+(NSString *)imageNameWithCard:(NSInteger)type;
+(NSString *)imageNameWithState:(NSInteger)state;
+(NSString *)imageNameWithSate:(NSInteger)state type:(NSInteger)type;
+(NSString *)nameWithSate:(NSInteger)state type:(NSInteger)type;
+(NSString *)parkingTypeNameWithtype:(NSInteger)type;

+(NSString *)payStyleWithSate:(NSInteger)state type:(NSInteger)type;
+(NSString *)weekDayFromNSString:(NSString *)weekStr;

@end
