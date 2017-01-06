//
//  MainViewController.m
//  QQGroup
//
//  Created by 新城集团 on 2016/12/16.
//  Copyright © 2016年 新城集团. All rights reserved.
//

#import "MainViewController.h"
#import "GroupCell.h"
#import "GroupModel.h"
#import "FriendModel.h"
#import "GroupHeaderView.h"
@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *groupArray;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"QQ分组"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
    
    [self setTableView:[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain]];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView registerClass:[GroupCell class] forCellReuseIdentifier:@"GroupCell"];
    [self.tableView registerClass:[GroupHeaderView class] forHeaderFooterViewReuseIdentifier:@"HeaderView"];
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray*)groupArray
{
    if(!_groupArray)
    {
        NSString *path=[[NSBundle mainBundle]pathForResource:@"qq" ofType:@"plist"];
        
        NSArray *groupArray=[NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *tempArray=[NSMutableArray array];
        for (NSDictionary * groupDict in groupArray) {
            GroupModel *model=[GroupModel modelWithDict:groupDict];
            [tempArray addObject:model];
        }
        _groupArray=[tempArray copy];
    
    }
    return _groupArray;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 60;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 40;
    
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    GroupHeaderView *headerview=[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"HeaderView"];
    GroupModel *groupModel=self.groupArray[section];
    [headerview updateHeaderViewWithModel:groupModel];
    [headerview setOpenHandler:^(BOOL isOpen) {
        groupModel.isOpen=isOpen;
        [tableView reloadData];
    }];
    return headerview;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;              // Default is 1 if not implemented
{
    return  self.groupArray.count;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    GroupModel * model=self.groupArray[section];
    return model.isOpen?model.friends.count:0;
    NSLog(@"123");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    GroupCell *cell =[tableView dequeueReusableCellWithIdentifier:@"GroupCell"];
    
    GroupModel * model=self.groupArray[indexPath.section];
    [cell updateWithFriendModel:model.friends[indexPath.row]];
    return cell;
}

@end
