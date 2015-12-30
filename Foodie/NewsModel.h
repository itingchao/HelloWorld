//
//  NewsModel.h
//  Foodie
//
//  Created by ms on 15/12/22.
//  Copyright © 2015年 LiuYunchao. All rights reserved.
//

#import <JSONModel/JSONModel.h>


@protocol listModelTwo <NSObject>
@end
@interface listModelTwo : JSONModel
@property (nonatomic, copy) NSString <Optional>*listID;
@property (nonatomic, copy) NSString <Optional>*title;
@property (nonatomic, copy) NSString <Optional>*des;
@property (nonatomic, copy) NSString <Optional>*comment;
@property (nonatomic, copy) NSString <Optional>*image;

@end
@interface resultModelTwo : JSONModel
@property (nonatomic, copy) NSString <Optional>*count;
@property (nonatomic, strong) NSMutableArray <listModelTwo>*list;
@end
@interface NewsModel : JSONModel
@property (nonatomic, copy) NSString <Optional>*status;
@property (nonatomic, copy) NSString <Optional>*info;
@property (nonatomic, strong) resultModelTwo <Optional>*result;
@end
