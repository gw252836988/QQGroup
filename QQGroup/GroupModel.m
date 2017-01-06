//
//  GroupModel.m
//  QQGroup
//
//  Created by 新城集团 on 2016/12/20.
//  Copyright © 2016年 新城集团. All rights reserved.
//

#import "GroupModel.h"
#import "FriendModel.h"
@implementation GroupModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    
}


//-(void)setFriends:(NSArray*)friends
//{
//    NSMutableArray *tempArray=[NSMutableArray array];
//    
//    for (NSDictionary *dataDict in tempArray) {
//        
//        FriendModel *model=[[FriendModel alloc]init];
//        
//        [model setValuesForKeysWithDictionary:dataDict];
//        [tempArray addObject:model];
//        
//    }
//    _friends=[tempArray copy];
//    
//}

-(void) setFriends:(NSArray *)friends
{
    NSMutableArray *tempArray=[NSMutableArray array];
    
        for (NSDictionary *dataDict in friends) {
    
            FriendModel *model=[[FriendModel alloc]init];
    
            [model setValuesForKeysWithDictionary:dataDict];
            [tempArray addObject:model];
    
        }
        _friends=[tempArray copy];
    
    
}



+(instancetype)modelWithDict:(NSDictionary *)Dict
{
    GroupModel *model=[[GroupModel alloc]init];
    [model setValuesForKeysWithDictionary:Dict];
  
   // [model setFriends:[Dict objectForKey:@"friends"]];
    return model;
    
    
}
@end
