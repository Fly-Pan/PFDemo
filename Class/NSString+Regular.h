//
//  NSString+Regular.h
//  TWApp
//
//  Created by line0 on 13-7-8.
//  Copyright (c) 2013年 makeLaugh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Regular)

- (BOOL)isValidateEmail;//邮箱符合性验证。
- (BOOL)isNumber;//全是数字。
- (BOOL)isEnglishWords;//验证英文字母。
- (BOOL)isValidatePassword;//验证密码：8—16位，只能包含字符、数字和 下划线。
- (BOOL)isChineseWords;//验证是否为汉字。
- (BOOL)isInternetUrl;//验证是否为网络链接。
- (BOOL)isPhoneNumber;//验证是否为电话号码。正确格式为：XXXX-XXXXXXX，XXXX-XXXXXXXX，XXX-XXXXXXX，XXX-XXXXXXXX，XXXXXXX，XXXXXXXX
- (BOOL)isElevenDigitNum;//判断是否为11位的数字
- (BOOL)isIdentifyCardNumber;//验证15或18位身份证。
-(BOOL) isValidateMobile;//不包含170段
-(BOOL)isMobileNumberClassification;//包含170段

//字符串是否为空
+ (NSString*)isNull:(NSString*)jString;
+ (NSString*)stringKeepTwoNumber:(NSString*)jString;

/*
 * 将时间处理成  多少分钟前  多少小时前 等
 */
- (NSString*)string_dealTime;

+(NSString *)timeFormatter:(int)totalSeconds;//将秒转化为HH：MM：SS格式

@end
