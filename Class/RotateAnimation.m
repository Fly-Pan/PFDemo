//
//  RotateAnimation.m
//  Layer
//
//  Created by  on 12-8-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RotateAnimation.h"
#import <QuartzCore/QuartzCore.h>

@implementation RotateAnimation

/*************第一个圆的持续变化动画******************/

-(void)firstCircleExecuteThree
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(firstCircleExecuteOne)];
    [UIView setAnimationDuration:2];
    circleView1.transform=CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
}

-(void)firstCircleExecuteTwo
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(firstCircleExecuteThree)];
    [UIView setAnimationDuration:2];
    circleView1.transform=CGAffineTransformMakeScale(2, 2);
    [UIView commitAnimations];
}

-(void)firstCircleExecuteOne
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(firstCircleExecuteTwo)];
    [UIView setAnimationDuration:2];
    circleView1.transform=CGAffineTransformMakeScale(1.5, 1.5);
    [UIView commitAnimations];
}

/*******************第二个圆的持续变化动画******************************/

-(void)secondCircleExecuteThree
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(secondCircleExecuteOne)];
    [UIView setAnimationDuration:2];
    circleView2.transform=CGAffineTransformMakeScale(2.0 / 3, 2.0 / 3);
    [UIView commitAnimations];
}

-(void)secondCircleExecuteTwo
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(secondCircleExecuteThree)];
    [UIView setAnimationDuration:2];
    circleView2.transform=CGAffineTransformMakeScale(4.0 / 3, 4.0 / 3);
    [UIView commitAnimations];
}

-(void)secondCircleExecuteOne
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(secondCircleExecuteTwo)];
    [UIView setAnimationDuration:2];
    circleView2.transform=CGAffineTransformMakeScale(1.0, 1.0);
    [UIView commitAnimations];
}

/*******************第三个圆的持续变化动画******************************/

-(void)thirdCircleExecuteThree
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(thirdCircleExecuteOne)];
    [UIView setAnimationDuration:2];
    circleView3.transform=CGAffineTransformMakeScale(1.0 / 2, 1.0 / 2);
    [UIView commitAnimations];
}

-(void)thirdCircleExecuteTwo
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(thirdCircleExecuteThree)];
    [UIView setAnimationDuration:2];
    circleView3.transform=CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
}

-(void)thirdCircleExecuteOne
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(thirdCircleExecuteTwo)];
    [UIView setAnimationDuration:2];
    circleView3.transform=CGAffineTransformMakeScale(3.0/ 4, 3.0 / 4);
    [UIView commitAnimations];
}

//创建环绕动画, 传入三个属性分别是 : 运动开始的角度(右侧90度为0), 运动结束的角度, 以及传入的是第几个物体
-(void)createAnimation:(float)startAngle andEndAngle:(float)endAngle andType:(int)type frame:(CGRect)frame;
{
        //创建运转动画
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	pathAnimation.calculationMode = kCAAnimationPaced;
	pathAnimation.fillMode = kCAFillModeForwards;
	pathAnimation.removedOnCompletion = NO;
	pathAnimation.duration = 30;
	pathAnimation.repeatCount = 1000;
        //设置运转动画的路径
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPathAddArc(curvedPath, NULL, frame.size.width/2, frame.size.height/2, frame.size.width/2-2, startAngle, endAngle, 0);
    pathAnimation.path = curvedPath;
	CGPathRelease(curvedPath);
    
    float x = 10;
    
    if(type == firstArc)
    {
        circleView1 = [[UIImageView alloc] init];
        [self addSubview:circleView1];
        circleView1.frame = CGRectMake(frame.size.width/2, frame.size.height/2, x, x);
        circleView1.backgroundColor = [UIColor whiteColor];
               //设置放大的动画
        circleView1.layer.cornerRadius = 5;
//        [UIView beginAnimations:nil context:nil];
//        [UIView setAnimationDelegate:self];
//        [UIView setAnimationDidStopSelector:@selector(firstCircleExecuteTwo)];
//        [UIView setAnimationDuration:2];
//        circleView1.transform=CGAffineTransformMakeScale(1.5, 1.5);
//        [UIView commitAnimations];
                //设置运转的动画
        [circleView1.layer addAnimation:pathAnimation forKey:@"moveTheCircleOne"];
    }
    else if(type == secondArc)
    {
        circleView2 = [[UIImageView alloc] init];
        [self addSubview:circleView2];
        circleView2.frame = CGRectMake(160, 140, 1.5 * x, 1.5 * x);
        circleView2.backgroundColor = [UIColor yellowColor];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(secondCircleExecuteThree)];
        [UIView setAnimationDuration:2];
        circleView2.transform=CGAffineTransformMakeScale(4.0 / 3, 4.0 / 3);
        [UIView commitAnimations];
        
        [circleView2.layer addAnimation:pathAnimation forKey:@"moveTheCircleTwo"];
    }
    else
    {
        circleView3 = [[UIImageView alloc] init];
        [self addSubview:circleView3];
        circleView3.frame = CGRectMake(160, 140, 2 * x, 2 * x);
        circleView3.backgroundColor = [UIColor yellowColor];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(thirdCircleExecuteOne)];
        [UIView setAnimationDuration:2];
        circleView3.transform=CGAffineTransformMakeScale(1.0 / 2, 1.0 / 2);
        [UIView commitAnimations];
        
        [circleView3.layer addAnimation:pathAnimation forKey:@"moveTheCircleThree"];
    }
}


//创建圆形路径
-(void)crearArcBackground:(CGRect)frame
{
    UIGraphicsBeginImageContext(frame.size);
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextSetStrokeColorWithColor(ctx, [UIColor colorWithWhite:1 alpha:.2].CGColor);
    CGContextSetLineWidth(ctx, 2);
    CGContextAddArc(ctx, frame.size.width/2, frame.size.height/2, frame.size.width/2-2, 0, 2*M_PI, 1);
	CGContextDrawPath(ctx, kCGPathStroke);
	UIImage *curve = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.width)];
    imageView.image = curve;
    imageView.center = self.center;
    [self addSubview:imageView];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self crearArcBackground:frame];
        [self createAnimation: -M_PI_2 andEndAngle:M_PI+M_PI_2 andType: 1 frame:frame];
//        [self createAnimation: M_PI * 5 / 6 andEndAngle: M_PI * 5 / 6 + 2 * M_PI andType:2];
//        [self createAnimation: M_PI * 3 / 2 andEndAngle: M_PI * 3 / 2 + 2 * M_PI andType:3];
    }
    return self;
}

-(void)setRotateAnimationBackgroundColor:(UIColor *)aColor
{
    self.backgroundColor = aColor;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
