//
//  NewsCell.m
//  Foodie
//
//  Created by ms on 15/12/22.
//  Copyright © 2015年 LiuYunchao. All rights reserved.
//

#import "NewsCell.h"
#import <UIImageView+WebCache.h>
@implementation NewsCell


- (void)updateWithModel:(listModelTwo *)model{
    _titleLabel.text = model.title;
    _desLabel.text = model.des;
    [_iconImageVIew sd_setImageWithURL:[NSURL URLWithString:model.image]];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
