//
//  HeaderButton.m
//  QQGroup
//
//  Created by 新城集团 on 2016/12/21.
//  Copyright © 2016年 新城集团. All rights reserved.
//

#import "HeaderButton.h"

@implementation HeaderButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype)buttonWithTarget:(id)target action:(SEL)action
{
    HeaderButton *button =[HeaderButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 40)];
    [button setBackgroundColor:[UIColor blueColor]];
    [button.titleLabel  setFont:[UIFont systemFontOfSize:18]];
    [button.layer setBorderColor:[UIColor whiteColor].CGColor];
    [button.layer setBorderWidth:0.5];
    
    [button setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
    [button.imageView setContentMode:UIViewContentModeCenter];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside]; 
    return  button;
    
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat height=CGRectGetHeight(contentRect);
    return CGRectMake(0, 0, height, height);
    
    
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    
    return CGRectMake(40, 0, CGRectGetWidth(contentRect)-55, CGRectGetHeight(contentRect));
}
@end
