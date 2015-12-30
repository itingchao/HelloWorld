//
//  NewsCell.h
//  Foodie
//
//  Created by ms on 15/12/22.
//  Copyright © 2015年 LiuYunchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"
@interface NewsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageVIew;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *desLabel;

- (void)updateWithModel:(listModelTwo *)model;
@end
