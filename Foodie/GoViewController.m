//
//  GoViewController.m
//  Foodie
//
//  Created by ms on 15/12/20.
//  Copyright © 2015年 LiuYunchao. All rights reserved.
//

#import "GoViewController.h"
#import "GoModel.h"
#include "GoWhereCell.h"
#import <AFNetworking/AFNetworking.h>
@interface GoViewController ()<UITableViewDataSource, UITableViewDelegate>{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
}

@end

@implementation GoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = [[NSMutableArray alloc]init];
    [self createTableView];
}

- (void)createTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenWidth(), screenHeight()) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    UINib *nib = [UINib nibWithNibName:@"GoWhereCell" bundle:nil];
    [_tableView registerNib:nib forCellReuseIdentifier:@"cellId"];
    [self LoadDataWithURL:YES];
}

- (void)LoadDataWithURL:(BOOL)isMore{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:GOWHERE parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        //NSLog(@"%@", dict);
        NSDictionary *resultDic = dict[@"result"];
        NSArray *listArray = resultDic[@"list"];
        for (NSDictionary *listDic in listArray) {
            golistModel *model = [[golistModel alloc]initWithDictionary:listDic error:nil];
            [_dataArray addObject:model];
            
        }
        //[_dataArray removeAllObjects];
        [_tableView reloadData];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cellId";
    GoWhereCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[GoWhereCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    golistModel *model = _dataArray[indexPath.row];
    [cell updataWith:model];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
