//
//  GroupHeaderView.h
//  QQGroup
//
//  Created by 新城集团 on 2016/12/21.
//  Copyright © 2016年 新城集团. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderButton.h"
#import "GroupModel.h"
@interface GroupHeaderView : UITableViewHeaderFooterView
@property(nonatomic,strong) HeaderButton *headerButton;
@property(nonatomic,assign,readonly) BOOL isOpen;

@property(nonatomic,copy)void (^openHandler)(BOOL isOpen);

-(void)updateHeaderViewWithModel:(GroupModel *)model;

@end
