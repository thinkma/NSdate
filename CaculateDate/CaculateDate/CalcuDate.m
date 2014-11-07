//
//  CalcuDate.m
//  CaculateDate
//
//  Created by Apple on 14-11-7.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import "CalcuDate.h"



@implementation CalcuDate

+ (void)currentData
{

    NSDate * currentDate = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents*comps;
    
    // 年月日获得
    // comps =[calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit |NSDayCalendarUnit)
    comps =[calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitDay)
                       fromDate:currentDate];
    NSInteger year = [comps year];
    
    NSInteger month = [comps month];
    
    NSInteger day = [comps day];
    
    NSLog(@"year:%d month: %d, day: %d", year, month, day);
    
    
//  小时，分，秒
    comps =[calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute |NSCalendarUnitSecond)
            
                       fromDate:currentDate];
    
    NSInteger hour = [comps hour];
    
    NSInteger minute = [comps minute];
    
    NSInteger second = [comps second];
    
    NSLog(@"hour:%d minute: %d second: %d", hour, minute, second);
    
//  星期几的获得
    comps =[calendar components:(NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekday |NSCalendarUnitWeekdayOrdinal)
            
                       fromDate:currentDate];
    
    //NSCalendarUnitWeekOfMonth 这个月的第几周
    //NSCalendarUnitWeekOfYear  这个年的第几周
    
    NSInteger week = [comps weekOfYear]; // 今年的第几周
    
    NSInteger weekday = [comps weekday]; // 星期几（注意，周日是“1”，周一是“2”。。。。）
    
    NSInteger weekdayOrdinal = [comps weekdayOrdinal]; // 这个月的第几周
    
    NSLog(@"week:%d weekday: %d weekday ordinal: %d", week, weekday, weekdayOrdinal);
    
//  时间格式
    NSDateFormatter*dateFormatter = [[NSDateFormatter alloc]init];
    
    if(/* DISABLES CODE */ (1))
        
        [dateFormatter setDateFormat:@"dd-MMM-yyy,hh:mm:ss"];
    
    else
        
        [dateFormatter setDateFormat:@"hh:mm:ss"];
    
   NSString * dataStr = [dateFormatter stringFromDate:[NSDate date]];
    
    NSLog(@"日期：%@",dataStr);
    
    
//     创建一定时间间隔的NSDate对象：
    
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    
    NSDate *tomorrow = [[NSDate alloc] initWithTimeIntervalSinceNow:secondsPerDay];
    
    NSDate *yesterday = [[NSDate alloc] initWithTimeIntervalSinceNow:-secondsPerDay];
    
    [CalcuDate formattime:tomorrow];
    [CalcuDate formattime:yesterday];
//    labelTime.font = [UIFontsystemFontOfSize:fontSlider.value];
    
//    [dateFormatter release];
}

+ (NSString *)formattime:(NSDate *)date
{

    NSDateFormatter*dateFormatter = [[NSDateFormatter alloc]init];
    
    if(/* DISABLES CODE */ (1))
        
        [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    
    else
        
        [dateFormatter setDateFormat:@"hh:mm:ss"];
    
    NSString * dataStr = [dateFormatter stringFromDate:date];
    
    //NSLog(@"日期：%@",dataStr);
    
    return dataStr;
    
    
}

//  明天
+ (NSString *)nextDay:(NSString *)day
{
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate * date = [CalcuDate nsstringToData:day];
    NSDate *  tomorrow = [date dateByAddingTimeInterval: secondsPerDay];
    NSString * days = [CalcuDate formattime:tomorrow];
    NSString * week = [CalcuDate getWeek:tomorrow];
    return [NSString stringWithFormat:@"%@ %@",days,week];
}

//  得到当前日期的是星期几
+ (NSString *)getWeek:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];

    NSDateComponents*comps;

    comps =[calendar components:(NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekday |NSCalendarUnitWeekdayOrdinal)
            
                       fromDate:date];
    
    //NSCalendarUnitWeekOfMonth 这个月的第几周
    //NSCalendarUnitWeekOfYear  这个年的第几周
    
  //  NSInteger week = [comps weekOfYear]; // 今年的第几周
    
    NSInteger weekday = [comps weekday]; // 星期几（注意，周日是“1”，周一是“2”。。。。）
    
   // NSInteger weekdayOrdinal = [comps weekdayOrdinal]; // 这个月的第几周
    
    NSString * weekstr = nil;
    
    switch (weekday) {
        case 1:
            weekstr = @"星期日";
            break;
        case 2:
             weekstr = @"星期一";
            break;
        case 3:
             weekstr = @"星期二";
            break;
        case 4:
             weekstr = @"星期三";
            break;
        case 5:
             weekstr = @"星期四";
            break;
        case 6:
            weekstr = @"星期五";
            break;
        case 7:
             weekstr = @"星期六";
            break;
        default:
            break;
    }
    
    
    return weekstr;
}

//  当前日期
+ (NSString * )currentDay{

    NSString * days = [CalcuDate formattime:[NSDate date]];
    NSString * week = [CalcuDate getWeek:[NSDate date]];
    return [NSString stringWithFormat:@"%@ %@",days,week];
    
}

//  前一天
+ (NSString *)lastday:(NSString *)day
{
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate * date = [CalcuDate nsstringToData:day];
    NSDate *  tomorrow = [date dateByAddingTimeInterval:-secondsPerDay];
    NSString * days = [CalcuDate formattime:tomorrow];
    NSString * week = [CalcuDate getWeek:tomorrow];
    return [NSString stringWithFormat:@"%@ %@",days,week];
}

//  格式化日期分开日期与星期
+ (NSDate *)nsstringToData:(NSString *)date
{

    NSArray * dataArr = [date componentsSeparatedByString:@" "];
    NSString  * dateStr = [dataArr objectAtIndex:0];
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    NSDate * inputDate = [dateFormatter dateFromString:dateStr];
    return inputDate;
}
@end
