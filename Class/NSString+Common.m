//
//  NSString+Common.m
//  YC-ZHSQ
//
//  Created by chen on 15/11/12.
//  Copyright © 2015年 JSYC-iOS. All rights reserved.
//

#import "NSString+Common.h"

@implementation NSString (Common)

// Checking if String is Empty          ***********是否含有空格字符串
-(BOOL)isBlank
{
    return ([[self removeWhiteSpacesFromString] isEqualToString:@""]) ? YES : NO;
}

//Checking if String is empty or nil    ***********字符串是否为空
-(BOOL)isValid
{
    return (self == nil || [[self removeWhiteSpacesFromString] isEqualToString:@""] ||  [self isEqualToString:@"(null)"]
            || [self isEqualToString:@"<null>"]) ? NO :YES;
}

// remove white spaces from String      ***********移除空格字符串
- (NSString *)removeWhiteSpacesFromString
{
    NSString *trimmedString = [self stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return trimmedString;
}

// Counts number of Words in String     ***********字符串字符个数
- (NSUInteger)countNumberOfWords
{
    NSScanner *scanner = [NSScanner scannerWithString:self];
    NSCharacterSet *whiteSpace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSUInteger count = 0;
    while ([scanner scanUpToCharactersFromSet: whiteSpace  intoString: nil]) {
        count++;
    }
    return count;
}

// If string contains substring         ***********字符串是否含有subString的字符串
- (BOOL)containsString:(NSString *)subString
{
    return ([self rangeOfString:subString].location == NSNotFound) ? NO : YES;
}

// If my string starts with given string ***********字符串是否首字节string
- (BOOL)isBeginsWith:(NSString *)string
{
    return ([self hasPrefix:string]) ? YES : NO;
}

// If my string ends with given string  ***********字符串是否末字节string
- (BOOL)isEndssWith:(NSString *)string
{
    return ([self hasSuffix:string]) ? YES : NO;
}

// Replace particular characters in my string with new character ***********字符串中字符的替换
- (NSString *)replaceCharcter:(NSString *)olderChar withCharcter:(NSString *)newerChar
{
    return  [self stringByReplacingOccurrencesOfString:olderChar withString:newerChar];
}

// Get Substring from particular location to given lenght ***********从字符串中截取需要的字符串
- (NSString*)getSubstringFrom:(NSInteger)begin to:(NSInteger)end
{
    NSRange r;
    r.location = begin;
    r.length = end - begin;
    return [self substringWithRange:r];
}

// Add substring to main String ***********拼接字符串 string
- (NSString *)addString:(NSString *)string
{
    if(!string || string.length == 0)
        return self;
    
    return [self stringByAppendingString:string];
}

// Remove particular sub string from main string ***********移除字符串 string
-(NSString *)removeSubString:(NSString *)subString
{
    if ([self containsString:subString])
    {
        NSRange range = [self rangeOfString:subString];
        return  [self stringByReplacingCharactersInRange:range withString:@""];
    }
    return self;
}


// If my string contains ony letters ***********字符串是否仅含有字母/abc...z/ABC...Z
- (BOOL)containsOnlyLetters
{
    NSCharacterSet *letterCharacterset = [[NSCharacterSet letterCharacterSet] invertedSet];
    return ([self rangeOfCharacterFromSet:letterCharacterset].location == NSNotFound);
}

// If my string contains only numbers ***********字符串是否仅含有数字0123456789
- (BOOL)containsOnlyNumbers
{
    NSCharacterSet *numbersCharacterSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    return ([self rangeOfCharacterFromSet:numbersCharacterSet].location == NSNotFound);
}

// If my string contains letters and numbers ***********字符串是否仅含有数字和字母
- (BOOL)containsOnlyNumbersAndLetters
{
    NSCharacterSet *numAndLetterCharSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
    return ([self rangeOfCharacterFromSet:numAndLetterCharSet].location == NSNotFound);
}

// If my string is available in particular array ***********数组中是否含有字符串self
- (BOOL)isInThisarray:(NSArray*)array
{
    for(NSString *string in array) {
        if([self isEqualToString:string]) {
            return YES;
        }
    }
    return NO;
}

// Get String from array
+ (NSString *)getStringFromArray:(NSArray *)array
{
    return [array componentsJoinedByString:@" "];
}

// Convert Array from my String
- (NSArray *)getArray
{
    return [self componentsSeparatedByString:@" "];
}

// Get My Application Version number ***********获得app版本
+ (NSString *)getMyApplicationVersion
{
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [info objectForKey:@"CFBundleVersion"];
    return version;
}

// Get My Application name ***********获得app的名称
+ (NSString *)getMyApplicationName
{
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *name = [info objectForKey:@"CFBundleDisplayName"];
    return name;
}


// Convert string to NSData ***********字符串转为data
- (NSData *)convertToData
{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

// Get String from NSData   ***********data转为字符串
+ (NSString *)getStringFromData:(NSData *)data
{
    return [[NSString alloc] initWithData:data
                                 encoding:NSUTF8StringEncoding];
    
}

// Is Valid Email

- (BOOL)isValidEmail
{
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTestPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [emailTestPredicate evaluateWithObject:self];
}

// Is Valid Phone

- (BOOL)isVAlidPhoneNumber
{
    NSString *regex = @"[235689][0-9]{6}([0-9]{3})?";
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [test evaluateWithObject:self];
}

// Is Valid URL

- (BOOL)isValidUrl
{
    NSString *regex =@"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [urlTest evaluateWithObject:self];
}

// Is get string rect
- (CGRect)getStringRect:(UIFont*)font size:(CGSize)size
{
    return [self boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading  attributes:@{NSFontAttributeName:font} context:nil];
}

- (NSString*)paraseEmptyString//解析空的字符串
{
    if (self == nil || [self isKindOfClass:[NSNull class]] || [self isEqualToString:@"(null)"] || [self isEqualToString:@"null"] || [self isEqualToString:@"<null>"] ) {
        return @"";
    }
    return self;
}

/*!
 
 * @brief 把格式化的JSON格式的字符串转换成字典
 
 * @param jsonString JSON格式的字符串
 
 * @return 返回字典
 
 */

- (NSDictionary *)dictionaryWithJsonString
{
    if (self == nil) {
        return nil;
    }
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

//将日期格式的转为 2015-12-08 24:00:00 转为20151208240000
- (NSString*)getDateString
{
    NSString *dateString = self;
    if ([dateString rangeOfString:@"-"].location != NSNotFound)
    {
        dateString = [dateString stringByReplacingOccurrencesOfString:@"-" withString:@""];
        if ([dateString rangeOfString:@" "].location != NSNotFound)
        {
            dateString = [dateString stringByReplacingOccurrencesOfString:@" " withString:@""];
        }
        
        if ([dateString rangeOfString:@":"].location != NSNotFound)
        {
            dateString = [dateString stringByReplacingOccurrencesOfString:@":" withString:@""];
        }
    }
//    NSLog(@"dateString=======%@",dateString);
    return dateString;
}

// 将系统表情字符串 转码和编码
- (NSString*)addUTF8UsingEncoding
{
    return [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}
- (NSString*)replacingUTF8UsingEncoding
{
    return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

// 过滤字符串中的表情
- (NSString*)clearSystemEmotion
{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]" options:NSRegularExpressionCaseInsensitive error:nil];
    NSString *modifiedString = [regex stringByReplacingMatchesInString:self
                                                               options:0
                                                                 range:NSMakeRange(0, [self length])
                                                          withTemplate:@""];
    return modifiedString;
}

// 判断字符串是否含有系统表情
- (BOOL)filterEmoji
{
    NSString *string = self;
    __block BOOL returnValue = NO;
    if([string length] != 0 && [[string clearSystemEmotion] length] == 0)
    {
        return YES;
    }
    return returnValue;
}

- (NSString *)translateNumberToChinese
{
    NSString *string = self;
    int number = [string intValue];
    switch (number) {
        case 1:
            string = @"一";
            break;
        case 2:
            string = @"二";
            break;
        case 3:
            string = @"三";
            break;
        case 4:
            string = @"四";
            break;
        case 5:
            string = @"五";
            break;
        case 6:
            string = @"六";
            break;
        case 7:
            string = @"七";
            break;
        case 8:
            string = @"八";
            break;
        case 9:
            string = @"九";
            break;
        case 10:
            string = @"十";
            break;
        case 11:
            string = @"十一";
            break;
        case 12:
            string = @"十二";
            break;
        default:
            break;
    }
    return string;
}

+(NSString *)getTimeFromIntervals:(NSString *)Intervals{
    NSDate *EndTimeDate = [NSDate dateWithTimeIntervalInMilliSecondSince1970:[Intervals doubleValue]];
    return [[NSDateFormatter defaultDateFormatter] stringFromDate:EndTimeDate];
}
+(NSString *)disitanceWithMyLocation:(CLLocationCoordinate2D)myPt parkingPt:(CLLocationCoordinate2D)dePt{
    CLLocation *current=[[CLLocation alloc] initWithLatitude:myPt.latitude longitude:myPt.longitude];
    //第二个坐标
    CLLocation *before=[[CLLocation alloc] initWithLatitude:dePt.latitude longitude:dePt.longitude];
    //计算距离
    CLLocationDistance meters=[current distanceFromLocation:before];
    NSString * distance = [NSString stringWithFormat:@"%f",meters];
    return distance;
}



@end
