//
//  + (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font {     UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];     label.text = title;     label.font = font;     [label sizeToFit];     return label.frame.size.m
//  Tsp-a
//
//  Created by Taiyuan on 16/7/28.
//  Copyright © 2016年 Taiyuan. All rights reserved.
//

#import "UILabel+LabelHeightAndWidth.h"

@implementation UILabel (LabelHeightAndWidth)
+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font
{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text = title;
    label.font = font;
    label.numberOfLines = 0;
    [label sizeToFit];
    CGFloat height = label.frame.size.height;
    return height;
}

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font {
    if (title.length>0) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
        label.text = title;
        label.font = font;
        [label sizeToFit];
        return label.frame.size.width;
    }else{
        return 10;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
