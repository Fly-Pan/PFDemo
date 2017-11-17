//
//  RedCo.m
//  button
//
//  Created by Taiyuan on 16/5/27.
//  Copyright © 2016年 Taiyuan. All rights reserved.
//

#import "RedCo.h"
#define mRGBToColor(rgb) [UIColor colorWithRed:((float)((rgb & 0xFF0000) >> 16))/255.0 green:((float)((rgb & 0xFF00) >> 8))/255.0 blue:((float)(rgb & 0xFF))/255.0 alpha:1.0]

@implementation RedCo
-(instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image target:(id)target acdaction:(SEL)action{
    self = [super initWithFrame:frame];
    if (self) {
        [self setImage:image forState:UIControlStateNormal];
        self.layer.shadowOpacity = 1;
        self.layer.shadowColor = mRGBToColor(0x999999).CGColor;
        self.layer.shadowOffset = ccs(0, 0);
        self.layer.shadowRadius = 1;
        [self setImage:image forState:UIControlStateNormal];
        [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        [self addRedLayer];
    }
    return self;
}
-(void)addRedLayer{
    CALayer * layer = [CALayer layer];
    layer.name = @"aa";
    layer.frame = CGRectMake(50-10, 6, 8, 8);
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.borderWidth = 1;
    layer.borderColor = [UIColor whiteColor].CGColor;
    layer.cornerRadius = 4;
    [self.layer addSublayer:layer];
    [self.layer insertSublayer:layer atIndex:0];

}
-(void)showMessage{
    for (CALayer * layer in self.layer.sublayers) {
        if ([layer.name isEqualToString: @"aa"]) {
            layer.backgroundColor = [UIColor redColor].CGColor;
            layer.borderColor = [UIColor whiteColor].CGColor;

        }
    }

}
-(void)hideMessage{
    for (CALayer * layer in self.layer.sublayers) {
        if ([layer.name isEqualToString: @"aa"]) {
            layer.backgroundColor = [UIColor clearColor].CGColor;
            layer.borderColor = [UIColor clearColor].CGColor;

        }
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
