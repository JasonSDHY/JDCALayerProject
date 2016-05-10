//
//  BHViewController.m
//  CALayerProject
//
//  Created by Jason Ding on 16/5/6.
//  Copyright © 2016年 Ding RedRain. All rights reserved.
//

#import "BHViewController.h"

/**
 *  弧度转换为角度
 */
#define RADIANS_TO_DEGREES(x) ((x)/M_PI*180.0)

/**
 *  角度转换为弧度
 */
#define DEGREES_TO_RADIANS(x) ((x)/180.0*M_PI)

@interface BHViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation BHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.


    CGAffineTransform transform = CGAffineTransformIdentity;
    
    
}

/**
 *  混合变换
 */
- (void)doMixTransform{
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformScale(transform, 0.5, 0.5);
    transform = CGAffineTransformRotate(transform, DEGREES_TO_RADIANS(30));
    transform = CGAffineTransformTranslate(transform, 200, 0);
    self.layerView.layer.affineTransform = transform;
}

/**
 *  简单变换
 */
- (void)doSimpleTransform{
    
    CGAffineTransform transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(45));
    self.layerView.layer.affineTransform = transform;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
