//
//  NSString+Common.h
//  YC-ZHSQ
//
//  Created by chen on 15/11/12.
//  Copyright © 2015年 JSYC-iOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>
@interface NSString (Common)

-(BOOL)isBlank;// Checking if String is Empty
-(BOOL)isValid;//Checking if String is empty or nil
- (NSString *)removeWhiteSpacesFromString;// remove white spaces from String


- (NSUInteger)countNumberOfWords;// Counts number of Words in String
- (BOOL)containsString:(NSString *)subString;
- (BOOL)isBeginsWith:(NSString *)string;
- (BOOL)isEndssWith:(NSString *)string;

- (NSString *)replaceCharcter:(NSString *)olderChar withCharcter:(NSString *)newerChar;
- (NSString *)getSubstringFrom:(NSInteger)begin to:(NSInteger)end;
- (NSString *)addString:(NSString *)string;
- (NSString *)removeSubString:(NSString *)subString;

- (BOOL)containsOnlyLetters;
- (BOOL)containsOnlyNumbers;
- (BOOL)containsOnlyNumbersAndLetters;
- (BOOL)isInThisarray:(NSArray*)array;

+ (NSString *)getStringFromArray:(NSArray *)array;
- (NSArray *)getArray;

+ (NSString *)getMyApplicationVersion;
+ (NSString *)getMyApplicationName;

- (NSData *)convertToData;
+ (NSString *)getStringFromData:(NSData *)data;

- (BOOL)isValidEmail;
- (BOOL)isVAlidPhoneNumber;
- (BOOL)isValidUrl;

- (CGRect)getStringRect:(UIFont*)font size:(CGSize)size;

- (NSString*)paraseEmptyString;//解析空的字符串

//讲Json字符串转化为字典
- (NSDictionary *)dictionaryWithJsonString;

//将日期格式的转为 2015-12-08 24:00:00 转为20151208240000
- (NSString*)getDateString;

// 将字符串编码 NSUTF8StringEncoding
- (NSString*)addUTF8UsingEncoding;
// 将字符串反编码 NSUTF8StringEncoding
- (NSString*)replacingUTF8UsingEncoding;
// 删除字符串内的系统表情
- (NSString*)clearSystemEmotion;
// 判断字符串是否含有系统表情
- (BOOL)filterEmoji;
//数字转中文
- (NSString *)translateNumberToChinese;

/*
 *时间间隔转化为时间格式
 */
+ (NSString *)getTimeFromIntervals:(NSString *)Intervals;

/*
 *坐标转换距离
 */

+(NSString *)disitanceWithMyLocation:(CLLocationCoordinate2D)myPt parkingPt:(CLLocationCoordinate2D)dePt;

@end
