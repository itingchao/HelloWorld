//
//  CookBookCell.h
//  Foodie
//
//  Created by ms on 15/12/21.
//  Copyright © 2015年 LiuYunchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CookBookModel.h"
@interface CookBookCell : UITableViewCell

- (void)showDataWithModel:(listModel *)leftModel model:(listModel *)rightModel;
@end
