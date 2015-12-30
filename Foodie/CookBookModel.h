//
//  CookBookModel.h
//  Foodie
//
//  Created by ms on 15/12/21.
//  Copyright © 2015年 LiuYunchao. All rights reserved.
//

#import <JSONModel/JSONModel.h>


@protocol listModel

@end

@interface listModel : JSONModel

@property (nonatomic, copy) NSString <Optional> *listId;
@property (nonatomic, copy) NSString <Optional> *title;
@property (nonatomic, copy) NSString <Optional> *image;
@property (nonatomic, copy) NSString <Optional> *view;
@property (nonatomic, copy) NSString <Optional> *cooking;
@property (nonatomic, copy) NSString <Optional> *favourite;
@end

@interface resultModel : JSONModel

@property (nonatomic, copy) NSString <Optional>*count;
@property (nonatomic,strong) NSMutableArray <listModel>*list;

@end
@interface CookBookModel : JSONModel

@property (nonatomic, copy) NSString <Optional>*status;
@property (nonatomic, copy) NSString <Optional>*info;
@property (nonatomic, copy) NSString <Optional>*took;
@property (nonatomic, strong) resultModel *result;

@end
