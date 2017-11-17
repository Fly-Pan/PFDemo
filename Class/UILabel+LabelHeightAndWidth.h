//
//  + (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font {     UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];     label.text = title;     label.font = font;     [label sizeToFit];     return label.frame.size.h
//  Tsp-a
//
//  Created by Taiyuan on 16/7/28.
//  Copyright © 2016年 Taiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LabelHeightAndWidth)
+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font;

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;
@end
