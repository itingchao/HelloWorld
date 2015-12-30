//
//  GoWhereCell.m
//  Foodie
//
//  Created by ms on 15/12/22.
//  Copyright © 2015年 LiuYunchao. All rights reserved.
//

#import "GoWhereCell.h"
#import <UIImageView+WebCache.h>
@implementation GoWhereCell

- (void)updataWith:(golistModel *)model{
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:model.image]];
    _titleLabel.text = model.title;
    _cityLabel.text = model.city;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
