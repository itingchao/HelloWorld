//
//  GoModel.h
//  Foodie
//
//  Created by ms on 15/12/22.
//  Copyright © 2015年 LiuYunchao. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol golistModel <NSObject>
@end
@interface golistModel : JSONModel

@property (nonatomic, copy) NSString *listID;
@property (nonatomic, copy) NSString <Optional>*title;
@property (nonatomic, copy) NSString <Optional>*image;
@property (nonatomic, copy) NSString <Optional>*city;
@property (nonatomic, copy) NSString <Optional>*time_start;
@property (nonatomic, copy) NSString <Optional>*time_end;
@property (nonatomic, copy) NSString <Optional>*favourite;
@property (nonatomic, copy) NSString <Optional>*url;
@end
@interface GoResultModel : JSONModel
@property (nonatomic, copy) NSString <Optional>*count;
@property (nonatomic, strong) NSMutableArray <golistModel>*list;
@end
@interface GoModel : JSONModel
@property (nonatomic, copy) NSString <Optional>*status;
@property (nonatomic, copy) NSString <Optional>*info;
@property (nonatomic, copy) GoResultModel *result;
@end
