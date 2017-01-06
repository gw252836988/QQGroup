//
//  GroupCell.h
//  QQGroup
//
//  Created by 新城集团 on 2016/12/16.
//  Copyright © 2016年 新城集团. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendModel.h"
@interface GroupCell : UITableViewCell


@property(nonatomic,strong) UIImageView *avatarImageView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *subtitleLabel;

-(void)updateWithFriendModel:(FriendModel*)model;

@end
