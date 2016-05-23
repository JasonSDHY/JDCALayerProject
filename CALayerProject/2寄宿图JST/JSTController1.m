//
//  JSTController1.m
//  CALayerProject
//
//  Created by Jason Ding on 16/5/1.
//  Copyright © 2016年 Ding RedRain. All rights reserved.
//

#import "JSTController1.h"
#import "UIImage+CornerRadius.h"
@interface JSTController1 ()
@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation JSTController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImage *image = [UIImage imageNamed:@"2"];// 此处图片的格式需要是PNG
    [image imageAddCornerWithRadius:15 andSize:image.size];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    imageView.frame = CGRectMake(50, 50, 100, 100);
    [self.view addSubview:imageView];
    
    
    // 1.在一个UIView上面设置图片
//    self.layerView.layer.contents = (__bridge id)image.CGImage;
//    
//    // 2.设置内容模式
//    self.layerView.contentMode = UIViewContentModeCenter; // 此属性不会让图片进行拉伸,使用可以通过控制contentsScale
//    
//    //set the contentsScale to match image
//    self.layerView.layer.contentsScale = image.scale;// 这个值和@2x 写法有关
    
    

    
}

// 利用contentsCenter拉伸一个图片, 如果设置了模式UIViewContentModeCenter, 图片就不会拉伸
- (void)addStretchableImage:(UIImage *)image withContentCenter:(CGRect)rect toLayer:(CALayer *)layer
{
    //set image
    layer.contents = (__bridge id)image.CGImage;
    
    //set contentsCenter
    layer.contentsCenter = rect;
}


@end
