//
//  GroupCell.m
//  QQGroup
//
//  Created by 新城集团 on 2016/12/16.
//  Copyright © 2016年 新城集团. All rights reserved.
//

#import "GroupCell.h"

@implementation GroupCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self setAvatarImageView:[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 60, 60)]];
        
        [self.contentView addSubview:self.avatarImageView];
        
        [self setTitleLabel:[[UILabel alloc]initWithFrame:CGRectMake(75, 7, 120, 21)]];
        [self.contentView addSubview:self.titleLabel];
        
        [self setSubtitleLabel:[[UILabel alloc]initWithFrame:CGRectMake(75, 34, 250, 21)]];
        [self.contentView addSubview:self.subtitleLabel];
        
        
        UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 0.35)];
        [lineView setBackgroundColor:[UIColor blackColor]];
        [self.contentView addSubview:lineView];
        
        
        
        
    }
    return self;
}


-(void)updateWithFriendModel:(FriendModel*)model
{
    [self.avatarImageView  setImage:[UIImage imageNamed:model.icon]];
    
    [self.titleLabel setText:model.name];
    [self.subtitleLabel setText:model.message];
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
