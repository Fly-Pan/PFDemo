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

#import "NSString+Valid.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (Valid)
-(BOOL)isChinese{
    NSString *match=@"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}
+(NSString*)DataTOjsonString:(id)object
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}
-(NSString *)md5HexDigest:(NSString*)input
{
    const char* str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02X",result[i]];
    }
    return ret;
}
+(NSString *)imageNameWithCard:(NSInteger)type{
    NSString * imageName;
    switch (type) {
        case 1:
            imageName = @"用券";
            break;
        case 2:
            imageName = @"月卡";
            break;
        default:
            break;
    }

    
    return imageName;
}
+(NSString *)imageNameWithtype:(NSInteger)type{
    NSString * imageName;
    switch (type) {
        case 11:
            imageName = @"普通车位";
            break;
        case 12:
            imageName = @"无障碍车位";
            break;
        case 13:
            imageName = @"充电车位";
            break;
        case 14:
            imageName = @"女士车位";
            break;
        case 15:
            imageName = @"VIP车位";
            break;
        default:
            break;
    }
    return imageName;
}
+(NSString *)imageNameWithState:(NSInteger)state{
    NSString * imageName;
    switch (state) {
        case 1:
            imageName = @"全透明";
            break;
        case 2:
            imageName = @"故障";//故障
            break;
        case 3:
            imageName = @"故障";//停用
            break;
        case 4:
            imageName = @"虚线车";//预留
            break;
        case 5:
            imageName = @"车";//停车
            break;
        default:
            break;
    }
    
    return imageName;
}

+(NSString *)imageNameWithSate:(NSInteger)state type:(NSInteger)type{
    NSString * imageName;
    switch (state) {
        case 1:
            switch (type) {
                case 2:
                    imageName = @"自助缴费机";
                    break;
                case 3:
                    imageName = @"出入口";
                    break;
                case 11:
                    imageName = @"可使用";
                    break;
                case 12:
                    imageName = @"无障碍车位";
                    break;
                case 13:
                    imageName = @"充电车位";
                    break;
                case 14:
                    imageName = @"女性车位";
                    break;
                case 15:
                    imageName = @"VIP车位";
                    break;
                default:
                    break;
            }
            
            break;
        case 0:
            imageName = @"占用";
            break;
            
        default:
            break;
    }
    return imageName;
}
+(NSString *)nameWithSate:(NSInteger)state type:(NSInteger)type{
    NSString * imageName;

            switch (type) {
                case 2:
                    imageName = @"自助缴费机";
                    break;
                case 3:
                    imageName = @"出入口";
                    break;
                case 11:
                    imageName = @"普通车位";
                    break;
                case 12:
                    imageName = @"无障碍车位";
                    break;
                case 13:
                    imageName = @"充电车位";
                    break;
                case 14:
                    imageName = @"女性车位";
                    break;
                case 15:
                    imageName = @"VIP车位";
                    break;
                default:
                    break;
            }
            
    return imageName;
}

+(NSString *)payStyleWithSate:(NSInteger)state type:(NSInteger)type{
    NSString *payStyle;
    
    switch (type) {
        case 1:
            payStyle = @"支付宝";
            break;
        case 2:
            payStyle = @"微信";
            break;
        case 3:
            payStyle = @"包月卡";
            break;
        case 4:
            payStyle = @"优惠券";
            break;

                 default:
            break;
    }
    
    return payStyle;
}

+(NSString *)parkingTypeNameWithtype:(NSInteger)type{
    NSString *payStyle;
    
    switch (type) {
        case 1:
            payStyle = @"地面停车场";
            break;
        case 2:
            payStyle = @"地下停车场";
            break;
        case 3:
            payStyle = @"路边停车场";
            break;
        case 4:
            payStyle = @"立体停车场";
            break;
            
        default:
            break;
    }
    return payStyle;
}

+(NSString *)weekDayFromNSString:(NSString *)weekStr{
    NSString * week;
    NSInteger weekInt = [weekStr integerValue];
    switch (weekInt) {
        case 0:
            week = @"星期日";
            break;
        case 1:
            week = @"星期一";
            break;
        case 2:
            week = @"星期二";
            break;
        case 3:
            week = @"星期三";
            break;
        case 4:
            week = @"星期四";
            break;
        case 5:
            week = @"星期五";
            break;
        case 6:
            week = @"星期六";
            break;
            
        default:
            break;
    }
    return week;
}


@end
