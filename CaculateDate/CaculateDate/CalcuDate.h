//
//  CalcuDate.h
//  CaculateDate
//
//  Created by Apple on 14-11-7.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalcuDate : NSObject

//  明天
+ (NSString *)nextDay:(NSString *)day;
//  当前日期
+ (NSString * )currentDay;
// 昨天
+ (NSString *)lastday:(NSString *)day;
@end
