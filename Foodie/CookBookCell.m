
//
//  CookBookCell.m
//  Foodie
//
//  Created by ms on 15/12/21.
//  Copyright © 2015年 LiuYunchao. All rights reserved.
//

#import "CookBookCell.h"
#import <UIImageView+WebCache.h>
@implementation CookBookCell{
    UIImageView *_leftImageView;
    UIImageView *_rightImageView;
    UIImageView *_leftlookImageView;
    UIImageView *_leftfavourteImageView;
    UIImageView *_leftCookImageView;
    UIImageView *_rightLookImageView;
    UIImageView *_rightFavouriteImageView;
    UIImageView *_rightCookImageView;
    UILabel *_leftViewLabel;
    UILabel *_leftTitleLabel;
    UILabel *_rightViewLabel;
    UILabel *_leftFavouriteLabel;
    UILabel *_rightFavouritelabel;
    UILabel *_leftCookingLabel;
    UILabel *_rightCookingLabel;
    UILabel *_rightTitleLabel;
    
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self customView];
    }
    return self;
}

- (void)customView{
    
    _leftImageView = [UIImageView new];
    _leftCookingLabel = [UILabel new];
    _leftFavouriteLabel = [UILabel new];
    _leftViewLabel = [UILabel new];
    _leftCookImageView = [UIImageView new];
    _leftfavourteImageView = [UIImageView new];
    _leftlookImageView = [UIImageView new];
    _leftTitleLabel = [UILabel new];
    
    _rightCookingLabel = [UILabel new];
    _rightFavouritelabel = [UILabel new];
    _rightImageView = [UIImageView new];
    _rightViewLabel = [UILabel new];
    _rightCookImageView = [UIImageView new];
    _rightFavouriteImageView =[UIImageView new];
    _rightLookImageView = [UIImageView new];
    _rightTitleLabel = [UILabel new];
    
    [self.contentView addSubview:_rightViewLabel];
    [self.contentView addSubview:_rightImageView];
    [self.contentView addSubview:_rightFavouritelabel];
    [self.contentView addSubview:_rightCookingLabel];
    [self.contentView addSubview:_rightCookImageView];
    [self.contentView addSubview:_rightFavouriteImageView];
    [self.contentView addSubview:_rightLookImageView];
    [self.contentView addSubview:_rightTitleLabel];
    
    [self.contentView addSubview:_leftImageView];
    [self.contentView addSubview:_leftCookingLabel];
    [self.contentView addSubview:_leftFavouriteLabel];
    [self.contentView addSubview:_leftViewLabel];
    [self.contentView addSubview:_leftlookImageView];
    [self.contentView addSubview:_leftfavourteImageView];
    [self.contentView addSubview:_leftCookImageView];
    [self.contentView addSubview:_leftTitleLabel];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat leftPadding = 10;
    CGFloat topPadding = 10;
    CGFloat padding = 10.0;
    
    _leftImageView.frame = CGRectMake(leftPadding, topPadding, (screenWidth() - 2*leftPadding - padding)/2, (screenWidth() - 2*leftPadding - padding)/2);
    _leftTitleLabel.frame = CGRectMake(leftPadding, maxY(_leftImageView)+1, 200, 21);
    _leftlookImageView.frame = CGRectMake(leftPadding, maxY(_leftTitleLabel)+1, 20, 14);
    _leftViewLabel.frame = CGRectMake(maxX(_leftlookImageView), maxY(_leftTitleLabel)+1, 45, 12);
    _leftfavourteImageView.frame = CGRectMake(maxX(_leftViewLabel), maxY(_leftTitleLabel), 20, 14);
    _leftFavouriteLabel.frame = CGRectMake(maxX(_leftfavourteImageView), maxY(_leftTitleLabel)+1, 30, 12);
    _leftCookImageView.frame = CGRectMake(maxX(_leftFavouriteLabel), maxY(_leftTitleLabel), 20, 14);
    _leftCookingLabel.frame = CGRectMake(maxX(_leftCookImageView), maxY(_leftTitleLabel)+1, 30, 12);
    _rightImageView.frame = CGRectMake(maxX(_leftImageView) + padding, topPadding, width(_leftImageView), height(_leftImageView));
    _rightTitleLabel.frame = CGRectMake(maxX(_leftImageView) + padding, maxY(_rightImageView), 200, 21);
    _rightLookImageView.frame = CGRectMake(maxX(_leftImageView) + padding, maxY(_rightTitleLabel) + 1, 20, 14);
    _rightViewLabel.frame = CGRectMake(maxX(_rightLookImageView), maxY(_rightTitleLabel) + 1, 45, 12);
    _rightFavouriteImageView.frame = CGRectMake(maxX(_rightViewLabel), maxY(_rightTitleLabel), 20, 14);
    _rightFavouritelabel.frame = CGRectMake(maxX(_rightFavouriteImageView), maxY(_rightTitleLabel)+1, 30, 14);
    _rightCookImageView.frame = CGRectMake(maxX(_rightFavouritelabel), maxY(_rightTitleLabel), 20, 14);
    _rightCookingLabel.frame = CGRectMake(maxX(_rightCookImageView), maxY(_rightTitleLabel)+1, 30, 14);
    
    
}
- (void)awakeFromNib {
    
}

- (void)showDataWithModel:(listModel *)leftModel model:(listModel *)rightModel{
    [_leftImageView sd_setImageWithURL:[NSURL URLWithString:leftModel.image] placeholderImage:[UIImage imageNamed:@"app_loading"]];
    _leftTitleLabel.text = leftModel.title;
    _leftViewLabel.text = leftModel.view;
    _leftFavouriteLabel.text = leftModel.favourite;
    _leftCookingLabel.text = leftModel.cooking;
    _leftlookImageView.image = [UIImage imageNamed:@"app_ic_look_count.png"];
    _leftfavourteImageView.image = [UIImage imageNamed:@"app_ic_fav_count.png"];
    _leftCookImageView.image = [UIImage imageNamed:@"app_ic_cook_count.png"];
    [_rightImageView sd_setImageWithURL:[NSURL URLWithString:rightModel.image] placeholderImage:[UIImage imageNamed:@"app_loading"]];
    _rightLookImageView.image = [UIImage imageNamed:@"app_ic_look_count.png"];
    _rightFavouriteImageView.image = [UIImage imageNamed:@"app_ic_fav_count.png"];
    _rightCookImageView.image = [UIImage imageNamed:@"app_ic_cook_count.png"];
    _rightTitleLabel.text = rightModel.title;
    _rightViewLabel.text = rightModel.view;
    _rightFavouritelabel.text = rightModel.favourite;
    _rightCookingLabel.text = rightModel.cooking;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
