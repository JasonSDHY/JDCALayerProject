//
//  YSDHController.m
//  CALayerProject
//
//  Created by Jason Ding on 16/5/23.
//  Copyright © 2016年 Ding RedRain. All rights reserved.
//

#import "YSDHController.h"

@interface YSDHController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (nonatomic, strong) CALayer *colorLayer;
@end

@implementation YSDHController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUp];
    
}
- (void)setUp{
    self.colorLayer = [[CALayer alloc]init];
    self.colorLayer.frame = CGRectMake(50, 50, 50, 50);
    self.colorLayer.backgroundColor = [UIColor orangeColor].CGColor;
    [self.layerView.layer addSublayer:self.colorLayer];
}
- (IBAction)changeColorClick {
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    
    
}


@end
