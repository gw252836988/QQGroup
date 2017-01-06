//
//  GroupModel.h
//  QQGroup
//
//  Created by 新城集团 on 2016/12/20.
//  Copyright © 2016年 新城集团. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupModel : NSObject

@property(nonatomic,copy) NSArray * friends;
@property(nonatomic,copy) NSString * online;
@property(nonatomic,copy) NSString * title;
@property(nonatomic,assign) bool isOpen;
+(instancetype)modelWithDict:(NSDictionary *)Dict;

//this is my test
@end
