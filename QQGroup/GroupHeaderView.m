//
//  GroupHeaderView.m
//  QQGroup
//
//  Created by 新城集团 on 2016/12/21.
//  Copyright © 2016年 新城集团. All rights reserved.
//

#import "GroupHeaderView.h"

@implementation GroupHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithReuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self setHeaderButton:[HeaderButton buttonWithTarget:self action:@selector(headerButtonClicked:)]];
        
        [self.contentView addSubview:self.headerButton];
        
    }
    return self;
}


-(void)updateHeaderViewWithModel:(GroupModel *)model
{
    [self.headerButton setTitle:[NSString stringWithFormat:@"%@ (%@)",model.title,model.online] forState:UIControlStateNormal];
    
    if(model.isOpen)
    {
        [self.headerButton.imageView setTransform:CGAffineTransformMakeRotation(M_PI_2)];
    }
    else
    {
          [self.headerButton.imageView setTransform:CGAffineTransformIdentity];
    }
    _isOpen=!model.isOpen;
}

-(void) headerButtonClicked:(HeaderButton*)sender
{
    self.openHandler(_isOpen);
    
}
@end
