//
//  UIView+CornerRadius.m
//  CALayerProject
//
//  Created by Jason Ding on 16/5/16.
//  Copyright © 2016年 Ding RedRain. All rights reserved.
//

#import "UIImage+CornerRadius.h"

@implementation UIImage (CornerRadius)

- (UIImage*)imageAddCornerWithRadius:(CGFloat)radius andSize:(CGSize)size{
    if (radius == 0) {
        return self;
    }
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    CGContextAddPath(ctx,path.CGPath);
    CGContextClip(ctx);
    [self drawInRect:rect];
    CGContextDrawPath(ctx, kCGPathFillStroke);
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
- (UIImage *)rr_annotationImage
{
    static UIView *snapshotView = nil;
    static UIImageView *imageView = nil;
    if ( !snapshotView )
    {
        snapshotView = [UIView new];
        snapshotView.frame = CGRectMake(0, 0, self.size.width, self.size.height);
        imageView = [UIImageView new];
        [snapshotView addSubview:imageView];
        imageView.clipsToBounds = YES;
        imageView.frame = snapshotView.bounds;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        CGFloat arrowWidth = 14;
        CGMutablePathRef path = CGPathCreateMutable();
        CGRect rectangle = CGRectInset(CGRectMake(0, 0, CGRectGetWidth(imageView.bounds), CGRectGetWidth(imageView.bounds)), 3,3);
        CGPoint p[3] = {
            {CGRectGetMidX(imageView.bounds)-arrowWidth/2, CGRectGetWidth(imageView.bounds)-6},
            {CGRectGetMidX(imageView.bounds)+arrowWidth/2, CGRectGetWidth(imageView.bounds)-6},
            {CGRectGetMidX(imageView.bounds), CGRectGetHeight(imageView.bounds)-4}
        };
        CGPathAddRoundedRect(path, NULL, rectangle, 5, 5);
        CGPathAddLines(path, NULL, p, 3);
        CGPathCloseSubpath(path);
        CAShapeLayer *shapelayer = [CAShapeLayer layer];
        shapelayer.frame = imageView.bounds;
        shapelayer.path = path;
        imageView.layer.mask = shapelayer;
        snapshotView.layer.shadowPath = path;
        snapshotView.layer.shadowRadius = 1.0f;
        snapshotView.layer.shadowColor = [UIColor redColor].CGColor;
        snapshotView.layer.shadowOpacity = 1.0f;
        snapshotView.layer.shadowOffset = CGSizeMake(0, 0);
        CGPathRelease(path);
    }
    imageView.image = self;
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    [snapshotView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *copied = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return copied;
}
@end
