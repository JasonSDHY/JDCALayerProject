//
//  ZYTCViewController.m
//  CALayerProject
//
//  Created by Jason Ding on 16/5/11.
//  Copyright © 2016年 Ding RedRain. All rights reserved.
//

#import "ZYTCViewController.h"
#import <CoreText/CoreText.h>

@interface ZYTCViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation ZYTCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self CAEAGLLayer];
}
#pragma mark - CAEAGLLayer
- (void)CAEAGLLayer{
    
}

#pragma mark - CAEmitterLayer
- (void)CAEmitterLayer{
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:emitter];
    
    emitter.renderMode = kCAEmitterLayerAdditive;
    emitter.emitterPosition = CGPointMake(emitter.frame.size.width/2.0, emitter.frame.size.height/2.0);
    
    CAEmitterCell *cell = [[CAEmitterCell alloc]init];
    cell.contents = (__bridge id)[UIImage imageNamed:@"3"].CGImage;
    cell.birthRate = 150;
    cell.lifetime = 5.0;
//    cell.color = [UIColor colorWithRed:1 green:0.5 blue:0.1 alpha:0.1].CGColor;
    cell.alphaSpeed = -0.4;
    cell.velocity = 50;
    cell.velocityRange = 550;
    cell.emissionRange = M_PI * 2.0;
    
    emitter.emitterCells = @[cell];
}

#pragma mark - CAReplicatorLayer
- (void)CAReplicatorLayer{
    CAReplicatorLayer *replicator = [CAReplicatorLayer layer];
    replicator.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:replicator];
    
    replicator.instanceCount = 10;
    
    CATransform3D transfrom = CATransform3DIdentity;
    transfrom = CATransform3DTranslate(transfrom, 0, 200, 0);
    transfrom = CATransform3DRotate(transfrom, M_PI / 105.0, 0, 0, 1);
    transfrom = CATransform3DTranslate(transfrom, 0, -200, 0);
    replicator.instanceTransform = transfrom;
    
    replicator.instanceBlueOffset = -0.1;
    replicator.instanceGreenOffset = -0.1;
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(100.0f, 100.0f, 100.0f, 100.0f);
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    [replicator addSublayer:layer];
}

#pragma mark - CAGradientLayer
- (void)CAGradientLayer{
    
    // 在一个layer混合两种颜色, 做渐变显示
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:gradientLayer];
    
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id) [UIColor yellowColor].CGColor, (__bridge id)[UIColor greenColor].CGColor];
    gradientLayer.locations = @[@0.0, @0.25, @0.5];

    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);
    
}

#pragma mark - CATransformLayer
- (CALayer *)faceWithTransform:(CATransform3D)fransform{
    // 创建立方体图层
    CALayer *face = [CALayer layer];
    face.frame = CGRectMake(-50, -50, 100, 100);
    
    // 实现随机色
    CGFloat red = (rand() / (double)INT_MAX);
    CGFloat green = (rand() / (double)INT_MAX);
    CGFloat blue = (rand() / (double)INT_MAX);
    face.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1].CGColor;
    
    face.transform = fransform;
    return face;
    
}

- (CALayer *)cubeWithTransform:(CATransform3D)transform{
    // 创建立方体图层
    CATransformLayer *cube = [CATransformLayer layer];
    
    // 添加第一面
    CATransform3D ct = CATransform3DMakeTranslation(0, 0, 50);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    // 面2
    ct = CATransform3DMakeTranslation(50, 0, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    // 面3
    ct = CATransform3DMakeTranslation(0, -50, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    //add cube face 4
    ct = CATransform3DMakeTranslation(0, 50, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    //add cube face 5
    ct = CATransform3DMakeTranslation(-50, 0, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    //add cube face 6
    ct = CATransform3DMakeTranslation(0, 0, -50);
    ct = CATransform3DRotate(ct, M_PI, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    CGSize containerSize = self.containerView.bounds.size;
    cube.position = CGPointMake(containerSize.width/2.0, containerSize.height/2.0);
    
    cube.transform = transform;
    return cube;
}

- (void)CATransformLayer{
    
    CATransform3D pt = CATransform3DIdentity;
    pt.m34 = -1.0 / 500.0;
    self.containerView.layer.sublayerTransform = pt;
    
    CATransform3D c1t = CATransform3DIdentity;
    c1t = CATransform3DTranslate(c1t, -100, 0, 0);
    c1t = CATransform3DRotate(c1t, -M_PI_4, 1, 0, 0);

    CALayer *cube1 = [self cubeWithTransform:c1t];
    [self.containerView.layer addSublayer:cube1];
    
    CATransform3D c2t = CATransform3DIdentity;
    c2t = CATransform3DTranslate(c2t, 100, 0, 0);
    c2t = CATransform3DRotate(c2t, -M_PI_4, 1, 0, 0);
    c2t = CATransform3DRotate(c2t, -M_PI_4, 0, 1, 0);
    CALayer *cube2 = [self cubeWithTransform:c2t];
    [self.containerView.layer addSublayer:cube2];
    
}
#pragma mark - CATextLayer
- (void)testNSTextAttributeName{
    // 创建一个textLayer
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = self.containerView.bounds;
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    [self.containerView.layer addSublayer:textLayer];
    
    // 设置文字属性
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;
    
    // 选择字体
    UIFont *font = [UIFont systemFontOfSize:15];
    
    // 选择文字
    NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing  elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar  leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc  elementum, libero ut porttitor dictum, diam odio congue lacus, vel fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet  lobortis";
    
    // 创建属性字符串
    NSMutableAttributedString *string = nil;
    string = [[NSMutableAttributedString alloc]initWithString:text];
    
    // 转换UIFout为CTFont
    CFStringRef fontName = (__bridge CFStringRef)(font.fontName);
    CGFloat fontSize = font.pointSize;
    CTFontRef fontRef = CTFontCreateWithName(fontName, fontSize, NULL);
    
    // 设置text属性
    NSDictionary *attribs = @{
                              (__bridge id)kCTForegroundColorAttributeName:(__bridge id)[UIColor blueColor].CGColor,
                              (__bridge id)kCTFontAttributeName: (__bridge id)fontRef
                              };
    
    [string setAttributes:attribs range:NSMakeRange(0, text.length)];
    attribs = @{
                (__bridge id)kCTForegroundColorAttributeName: (__bridge id)[UIColor redColor].CGColor,
                (__bridge id)kCTUnderlineStyleAttributeName: @(kCTUnderlineStyleSingle),
                (__bridge id)kCTFontAttributeName: (__bridge id)fontRef
                };
    [string setAttributes:attribs range:NSMakeRange(6, 5)];
    
    // 释放之前创建的CTFont
    CFRelease(fontRef);
    
    // 设置图层
    textLayer.string = string;
    
}
/**
 *  边角带弧度的矩形
 */
- (void)bezierRoundedRect{
    CGRect rect = CGRectMake(50, 50, 100, 100);
    CGSize radii = CGSizeMake(20, 20);
    UIRectCorner corners = UIRectCornerTopRight | UIRectCornerBottomRight | UIRectCornerBottomLeft;
    
    // 创建路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    
    self.containerView.layer.accessibilityPath = path;
//    [self.containerView.layer addSublayer:shapeLayer];
}

/**
 *  火柴人
 */
- (void)makeFireMan{
    
    UIBezierPath *path = [UIBezierPath new];
    
    [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [path moveToPoint:CGPointMake(150, 125)];
    [path addLineToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(125, 225)];
    [path moveToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(175, 225)];
    [path moveToPoint:CGPointMake(100, 150)];
    [path addLineToPoint:CGPointMake(200, 150)];
    
    // create shape layer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 5;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    
    // add it to our view
    [self.containerView.layer addSublayer:shapeLayer];

}



@end
