//
//  GoWhereCell.h
//  Foodie
//
//  Created by ms on 15/12/22.
//  Copyright © 2015年 LiuYunchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoModel.h"
@interface GoWhereCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;


@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;

- (void)updataWith:(golistModel *)model;

@end
