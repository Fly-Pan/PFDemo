//
//  UIView+Frame.h
//  GYJMusicPlayer
//
//  Created by 郭亚娟 on 14-2-25.
//  Copyright (c) 2014年 NetEase. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat width;

@property (nonatomic, getter = left, setter = setLeft:) CGFloat x;
@property (nonatomic) CGFloat left;

@property (nonatomic, getter = top, setter = setTop:) CGFloat y;
@property (nonatomic) CGFloat top;

@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;

@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;

@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;

-(BOOL) containsSubView:(UIView *)subView;
-(BOOL) containsSubViewOfClassType:(Class)className;
-(void) sizeToFitSubviews;

@end
