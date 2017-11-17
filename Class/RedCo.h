//
//  RedCo.h
//  button
//
//  Created by Taiyuan on 16/5/27.
//  Copyright © 2016年 Taiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RedCo : UIButton
-(instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image target:(id)target acdaction:(SEL)action;
-(void)showMessage;
-(void)hideMessage;
@end
