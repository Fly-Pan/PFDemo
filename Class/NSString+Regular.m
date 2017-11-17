//
//  NSString+Regular.m
//  TWApp
//
//  Created by line0 on 13-7-8.
//  Copyright (c) 2013年 makeLaugh. All rights reserved.
//

#import "NSString+Regular.h"
#import "NSDate+Category.h"

@implementation NSString (Regular)

- (BOOL)isValidateEmail
{
    NSString *regex = @"\\b([a-zA-Z0-9%_.+\\-]+)@([a-zA-Z0-9.\\-]+?\\.[a-zA-Z]{2,6})\\b";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isNumber
{
    NSString *regex = @"^[0-9]*$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isEnglishWords
{
    NSString *regex = @"^[A-Za-z]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

//字母数字下划线，8－16位
- (BOOL)isValidatePassword
{
    NSString *regex = @"^[\\w\\d_]{8,16}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isChineseWords
{
    NSString *regex = @"^[\u4e00-\u9fa5],{0,}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isInternetUrl
{
    NSString *regex = @"^http://([\\w-]+\\.)+[\\w-]+(/[\\w-./?%&=]*)?$ ；^[a-zA-z]+://(w+(-w+)*)(.(w+(-w+)*))*(?S*)?$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isPhoneNumber
{
    NSString *regex = @"^(\(\\d{3,4}\\)|\\d{3,4}-)?\\d{7,8}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}
-(BOOL) isValidateMobile{
    
    //手机号以13， 15，18开头，八个 \d 数字字符
//    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
//    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
//    //    NSLog(@"phoneTest is %@",phoneTest);
//    return [phoneTest evaluateWithObject:self];

    NSString *phoneRegex = @"^((13[0-9])|(145)|(147)|(15[^4,\\D])|(18[0,0-9])|(17[0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

- (BOOL)isElevenDigitNum
{
    NSString *regex = @"^[0-9]*$";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL result = [predicate evaluateWithObject:self];
    
    if (result && self.length == 11)
        return YES;
    
    return NO;
}

- (BOOL)isIdentifyCardNumber
{
    NSString *regex = @"^\\d{15}|\\d{}18$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

-(BOOL)isMobileNumberClassification{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188,1705
     * 联通：130,131,132,152,155,156,185,186,1709
     * 电信：133,1349,153,180,189,1700
     */
    //    NSString * MOBILE = @"^1((3//d|5[0-35-9]|8[025-9])//d|70[059])//d{7}$";//总况
    
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188，1705
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])//d|705)//d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186,1709
     17         */
    NSString * CU = @"^1((3[0-2]|5[256]|8[56])//d|709)//d{7}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189,1700
     22         */
    NSString * CT = @"^1((33|53|8[09])//d|349|700)//d{7}$";
    
    
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    NSString * PHS = @"^0(10|2[0-5789]|//d{3})//d{7,8}$";
    
    
    //    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",PHS];
    
    if (([regextestcm evaluateWithObject:self] == YES)
        || ([regextestct evaluateWithObject:self] == YES)
        || ([regextestcu evaluateWithObject:self] == YES)
        || ([regextestphs evaluateWithObject:self] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (NSString*)isNull:(NSString*)jString
{
    jString = [NSString stringWithFormat:@"%@",jString];
    if (![jString isKindOfClass:[NSString class]] || [jString isKindOfClass:[NSNull class]] || [jString isEqualToString:@"<null>"] || [jString isEqualToString:@"null"] || [jString isEqualToString:@"(null)"]) {
        return @"";
    }
    return jString;
}

+ (NSString*)stringKeepTwoNumber:(NSString*)jString{
    if (jString.length>0) {
        float jsFload = [jString floatValue];
        return [NSString stringWithFormat:@"%.2f",jsFload];
    }
    
    return jString;
}


/*
 *  处理成想要的格式日期
 */

- (NSString*)string_dealTime
{
    NSString *dealTime = self;
    NSString *newString = @"";
    if (dealTime == nil || [dealTime length] == 0 || [dealTime isKindOfClass:[NSNull class]]) return @"";
    //获得当前时间的时间戳
    NSDate *nowDate = [NSDate date];
    //将要处理的字符串事件转为时间戳
//    NSDate *dealDate = [HealthManager getDate:dealTime];
    
    /*
    if ([[dateString componentsSeparatedByString:@" "] count] == 3 && [dateString length] >= 20) {
        dateString = [dateString substringToIndex:19];
        if ([dateString rangeOfString:@"-"].location != NSNotFound) {
            [dateString stringByReplacingOccurrencesOfString:@"-" withString:@""];
        }
        if ([dateString rangeOfString:@":"].location != NSNotFound) {
            [dateString stringByReplacingOccurrencesOfString:@":" withString:@""];
        }
        if ([dateString rangeOfString:@" "].location != NSNotFound) {
            [dateString stringByReplacingOccurrencesOfString:@" " withString:@""];
        }
    }
     */
    
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_Hans_CN"]];
    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [inputFormatter setTimeZone:[NSTimeZone localTimeZone]];
    NSDate* dealDate = [inputFormatter dateFromString:dealTime];

    if (llabs(dealDate.hour-nowDate.hour) == 0 && llabs(dealDate.day-nowDate.day) == 0)
    {
        long long mintues = llabs(dealDate.minute-nowDate.minute) == 0? 1:llabs(dealDate.minute-nowDate.minute);
        newString = [NSString stringWithFormat:@"%lld分钟前",mintues];
    }
    else//一天内
    if (llabs(dealDate.day-nowDate.day) == 0)
    {

        newString = [NSString stringWithFormat:@"今天 %02ld:%02ld",dealDate.hour,dealDate.minute];
    }
    //昨天
    else if (llabs(dealDate.day-nowDate.day) == 1)
    {
        newString = [NSString stringWithFormat:@"昨天 %02ld:%02ld",dealDate.hour,dealDate.minute];
    }
    //一周内
    else if(llabs(dealDate.week-nowDate.week) == 0)
    {
        switch (dealDate.weekday) {
            case 1://星期日
                newString = @"星期日";
                break;
            case 2://星期一
                newString = @"星期一";
                break;
            case 3://星期二
                newString = @"星期二";
                break;
            case 4://星期三
                newString = @"星期三";
                break;
            case 5://星期四
                newString = @"星期四";
                break;
            case 6://星期五
                newString = @"星期五";
                break;
            case 7://星期六
                newString = @"星期六";
                break;
            default:
                break;
        }
    }
    //一月内
    else if(llabs(dealDate.month-nowDate.month) == 0)
    {
        newString = [NSString stringWithFormat:@"%ld-%ld",dealDate.month,dealDate.day];
    }
    //其他
    else
    {
        newString = [NSString stringWithFormat:@"%ld-%ld-%ld",dealDate.year,dealDate.month,dealDate.day];;;
    }
    return newString;
}

+(NSString *)timeFormatter:(int)totalSeconds
{
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    int hours = totalSeconds / 3600;

    return  [NSString stringWithFormat:@"%02d:%02d:%02d",hours, minutes, seconds];
}



@end
