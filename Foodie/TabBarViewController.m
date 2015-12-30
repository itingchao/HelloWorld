//
//  TabBarViewController.m
//  Foodie
//
//  Created by ms on 15/12/20.
//  Copyright © 2015年 LiuYunchao. All rights reserved.
//

#import "TabBarViewController.h"
#import "CookBaseViewController.h"
#import "LeftSlideViewController.h"
@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViewControllers];
    
}

- (void)createViewControllers{
    
    //NSArray *imageNames = @[@[@"", @""],@[@"", @""],@[@"", @""]];
    NSArray *titles = @[@"菜谱",@"新鲜事", @"去哪儿"];
    NSArray *viewControllersName = @[@"CookbookViewController", @"NewsViewController", @"GoViewController"];
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (int i = 0; i<3; i++) {
        Class class = NSClassFromString(viewControllersName[i]);
        CookBaseViewController *cookView = [[class alloc]init];
        UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:cookView];
        //UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Action_JD_categories"] style:UIBarButtonItemStylePlain target:self action:@selector(openLeftSlide)];
//        U
        cookView.title = titles[i];
        //navigationController.tabBarItem.image = [UIImage imageNamed:<#(nonnull NSString *)#>];
        [arr addObject:navigationController];
    }
    self.viewControllers = arr;
}

- (void)openLeftSlide {
    NSLog(@"test");
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
