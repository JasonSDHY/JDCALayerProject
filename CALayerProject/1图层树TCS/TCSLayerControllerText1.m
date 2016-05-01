//
//  TCSLayerControllerText1.m
//  CALayerProject
//
//  Created by Jason Ding on 16/5/1.
//  Copyright © 2016年 Ding RedRain. All rights reserved.
//

#import "TCSLayerControllerText1.h"

@interface TCSLayerControllerText1 ()
@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation TCSLayerControllerText1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 创建图层
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50.0f, 50.0f, 50.0f, 50.0f);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.layerView.layer addSublayer:blueLayer];

    
}
@end
