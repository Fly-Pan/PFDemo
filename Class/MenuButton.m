//
//  MenuButton.m
//  HNGant-HaoLan
//
//  Created by jsyuchi on 15/7/6.
//  Copyright (c) 2015年 jsyuci. All rights reserved.
//

#import "MenuButton.h"
#define kImageRate 0.5
@implementation MenuButton

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return self;
}
-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleX = 0;
    CGFloat titleY = contentRect.size.height * kImageRate;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(titleX, titleY, titleW, titleH);

}
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageX = 0;
    CGFloat imageY = 10;
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * kImageRate;
    return CGRectMake(imageX, imageY, imageW, imageH);

}

@end
