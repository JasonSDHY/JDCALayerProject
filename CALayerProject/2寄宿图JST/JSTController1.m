//
//  JSTController1.m
//  CALayerProject
//
//  Created by Jason Ding on 16/5/1.
//  Copyright © 2016年 Ding RedRain. All rights reserved.
//

#import "JSTController1.h"

@interface JSTController1 ()
@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation JSTController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImage *image = [UIImage imageNamed:@"SnowBros"];
    
    self.layerView.layer.contents = (__bridge id)image.CGImage;
    
}
@end
