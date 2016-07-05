//
//  Person.h
//  cell自定义
//
//  Created by myh on 16/3/24.
//  Copyright © 2016年 myh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic ,copy)NSString *name ;
@property(nonatomic ,copy)NSString *icon ;
@property(nonatomic ,copy) NSString *time ;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)PersonWithDict:(NSDictionary *)dict;


@end
