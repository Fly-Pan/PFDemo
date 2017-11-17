//
//  UIImage+Resizre.m
//  ParkingCar
//
//  Created by apple on 16/4/8.
//  Copyright © 2016年 Taiyuan. All rights reserved.
//

#import "UIImage+Resizre.h"

@implementation UIImage (Resizre)

+(UIImage *)setImageResizre:(UIImage *)image{
    
    
    CGFloat top = image.size.height/2;
    CGFloat left = image.size.width/2;
    //设置的区域是不可拉伸的
    UIImage *resImage =  [image resizableImageWithCapInsets:UIEdgeInsetsMake(top, left, top, left)];
    return resImage;
}

+ (UIImage *) createImageWithColor: (UIColor *) color frame:(CGRect)frame;
{
    CGRect rect=frame;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (UIImage *)circleImage:(UIImage *)image WithFrame:(CGRect)frame{
    
    // 开始图形上下文
    UIGraphicsBeginImageContextWithOptions(frame.size, NO, 0.0);
    
    // 获得图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 设置一个范围
    CGRect rect = CGRectMake(0, 0, frame.size.width, frame.size.height);
    
    // 根据一个rect创建一个椭圆
    CGContextAddEllipseInRect(ctx, rect);
    
    // 裁剪
    CGContextClip(ctx);
    
    // 将原照片画到图形上下文
    [image drawInRect:rect];
    // 从上下文上获取剪裁后的照片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    return newImage;
    
}

@end
