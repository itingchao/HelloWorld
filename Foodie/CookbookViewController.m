//
//  CookbookViewController.m
//  Foodie
//
//  Created by ms on 15/12/20.
//  Copyright © 2015年 LiuYunchao. All rights reserved.
//

#import "CookbookViewController.h"
#import "AppDelegate.h"
#import <MJRefresh/MJRefresh.h>
#import <AFNetworking/AFNetworking.h>
#import "CookBookModel.h"
#import "CookBookCell.h"
@interface CookbookViewController ()<UITableViewDataSource, UITableViewDelegate>{
    UITableView *_tableView;
    NSMutableArray *_leftDataArray;
    NSMutableArray *_rightDataArray;
}

@end

@implementation CookbookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
}
- (void)createTableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenWidth(), screenHeight()) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _rightDataArray = [[NSMutableArray alloc]init];
        _leftDataArray = [[NSMutableArray alloc]init];
        [self loadDataFromNet:YES];
        [self.view addSubview:_tableView];
    }
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadDataFromNet:NO];
    }];
    _tableView.mj_header = header;
    
    MJRefreshBackFooter *footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
        [self loadDataFromNet:YES];
    }];
    _tableView.mj_footer = footer;
    [_tableView.mj_header beginRefreshing];
}

- (void)loadDataFromNet:(BOOL)isMore {
    NSInteger page = 1;
    if (isMore) {
        if (_rightDataArray.count%10 == 0) {
            page = _rightDataArray.count/10+1 ;
        }else{
            [_tableView.mj_footer endRefreshing];
            return;
        }
    }
    NSString *url = [NSString stringWithFormat:COOKBOOKURL, (long)page];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //__weak typeof(self)weakSelf = self;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (!isMore) {
            [_rightDataArray removeAllObjects];
            [_leftDataArray removeAllObjects];
            [_tableView reloadData];
        }
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *resultDict = dic[@"result"];
        NSArray *listArray = resultDict[@"list"];
        for (NSInteger i=0; i<listArray.count; i++) {
            if (i%2) {
                NSDictionary *list = listArray[i];
                listModel *model = [[listModel alloc]initWithDictionary:list error:nil];
                [_leftDataArray addObject:model];
              //  NSLog(@"%@", responseObject);
            }else{
                NSDictionary *list = listArray[i];
                listModel *model = [[listModel alloc]initWithDictionary:list error:nil];
                [_rightDataArray addObject:model];
            }
        }
        [_tableView reloadData];
        isMore?[_tableView.mj_footer endRefreshing]:[_tableView.mj_header endRefreshing];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        isMore?[_tableView.mj_footer endRefreshing]:[_tableView.mj_header endRefreshing];
    }];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _rightDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identfier = @"indentifier";
    CookBookCell *cell = [tableView dequeueReusableCellWithIdentifier:identfier];
    if (cell == nil) {
        cell = [[CookBookCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identfier];
    }
    listModel *leftModel = _leftDataArray[indexPath.row];
    listModel *rightModel = _rightDataArray[indexPath.row];
    [cell showDataWithModel:leftModel model:rightModel];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 240;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

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
