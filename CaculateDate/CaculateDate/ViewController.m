//
//  ViewController.m
//  CaculateDate
//
//  Created by Apple on 14-11-7.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "CalcuDate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"== %@", [CalcuDate currentDay]);
    NSLog(@"== %@", [CalcuDate nextDay:@"2014年11月7日 星期-"]);
    NSLog(@"== %@", [CalcuDate lastday:@"2014年11月7日 星期-"]);
    [CalcuDate lastday:@"2014年5月15日 星期-"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
