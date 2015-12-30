//
//  NewsViewController.m
//  Foodie
//
//  Created by ms on 15/12/20.
//  Copyright © 2015年 LiuYunchao. All rights reserved.
//

#import "NewsViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "NewsModel.h"
#include "NewsCell.h"
@interface NewsViewController ()<UITableViewDataSource, UITableViewDelegate>{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
}

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = [NSMutableArray new];
    
    [self createTableView];
    [self loadDataFromURL:YES];
}

- (void)loadDataFromURL:(BOOL)isMore{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:NEWSURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        //NSLog(@"%@", dict);
        NSDictionary *resultDic = dict[@"result"];
        NSArray *listArray = resultDic[@"list"];
        for (NSDictionary *listDic in listArray) {
            listModelTwo *model = [[listModelTwo alloc]initWithDictionary:listDic error:nil];
            [_dataArray addObject:model];
            
        }
        //[_dataArray removeAllObjects];
        [_tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
- (void)createTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenWidth(), screenHeight()) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    UINib *nib1 = [UINib nibWithNibName:@"NewsCell" bundle:nil];
    [_tableView registerNib:nib1 forCellReuseIdentifier:@"cellId"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cellId";
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[NewsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    listModelTwo *model = _dataArray[indexPath.row];
    [cell updateWithModel:model];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (CGFloat)tableView:(UITableView *)tableView   heightForRowAtIndexPath:(NSIndexPath *)indexPath{
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
