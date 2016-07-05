//
//  Person.m
//  cell自定义
//
//  Created by myh on 16/3/24.
//  Copyright © 2016年 myh. All rights reserved.
// 

#import "Person.h"

@implementation Person

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        // 利用kvc字典转模型
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)PersonWithDict:(NSDictionary *)dict{


    return [[self alloc]initWithDict:dict];

}

 @end
