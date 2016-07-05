//
//  NSDate+MYHExtension.h
//  testtime
//
//  Created by myh on 16/7/5.
//  Copyright © 2016年 myh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (MYHExtension)


/**
 * 比较from和self的时间差值
 */
- (NSDateComponents *)deltaFrom:(NSDate *)from;

/**
 * 是否为今年
 */
- (BOOL)isThisYear;

/**
 * 是否为今天
 */
- (BOOL)isToday;

/**
 * 是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  是否为前天
 */
- (BOOL)isTwoYesterday;



@end
