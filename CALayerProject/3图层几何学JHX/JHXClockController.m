//
//  JHXClockController.m
//  CALayerProject
//
//  Created by Jason Ding on 16/5/3.
//  Copyright © 2016年 Ding RedRain. All rights reserved.
//

#import "JHXClockController.h"

@interface JHXClockController ()

@property (nonatomic, weak) UIImageView *hourHand;
@property (nonatomic, weak) UIImageView *minuteHand;
@property (nonatomic, weak) UIImageView *secondHand;
@property (nonatomic, weak) NSTimer *timer;

@end

@implementation JHXClockController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupImageView];
    
    //start timer
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    
    //set initial hand positions
    [self tick];
    
}

- (void)tick{
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSUInteger units = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
    CGFloat hoursAngle = (components.hour / 12.0) * M_PI * 2.0;
    CGFloat minsAngle = (components.minute / 60.0) * M_PI * 2.0;
    CGFloat secsAngle = (components.second / 60.0) * M_PI * 2.0;
    
    self.hourHand.transform = CGAffineTransformMakeRotation(hoursAngle);
    self.minuteHand.transform = CGAffineTransformMakeRotation(minsAngle);
    self.secondHand.transform = CGAffineTransformMakeRotation(secsAngle);
    
}


- (void)setupImageView{
    
    UIImageView *hourHand = [UIImageView new];
    [self.view addSubview:hourHand];
    self.hourHand = hourHand;
    
    UIImageView *minuteHand = [UIImageView new];
    [self.view addSubview:minuteHand];
    self.minuteHand = minuteHand;
    
    UIImageView *secondHand = [UIImageView new];
    [self.view addSubview:secondHand];
    self.secondHand = secondHand;
    
    
    // adjust anchor points
    self.secondHand.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.minuteHand.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.hourHand.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    
    // 左上是0,0 右下是1,1
    
}

@end
