//
//  LayerLabel.m
//  CALayerProject
//
//  Created by Jason Ding on 16/5/23.
//  Copyright © 2016年 Ding RedRain. All rights reserved.
//

#import "LayerLabel.h"
#import <CoreText/CoreText.h>

@implementation LayerLabel

+ (Class)layerClass{
    // 用CATextLayer替换CALayer作为Label的宿主视图
    return [CATextLayer class];
}

- (CATextLayer *)textLayer{
    return (CATextLayer *)self.layer;
}

- (void)setUp{
    // 设置UILabel的设置
    self.text = self.text;
    self.textColor = self.textColor;
    self.font = self.font;
    
    // 我们应该从UILabel的设置中得到设置,但是这个很复杂
    // 所以我们硬编码写在这
    [self textLayer].alignmentMode = kCAAlignmentJustified;
    
    [self textLayer].wrapped = YES;
    [self.layer display];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}
- (void)awakeFromNib{
    // 从xib中创建label
    [self setUp];
}

- (void)setText:(NSString *)text{
    super.text = text;
    
    // 设置layer的text
    [self textLayer].string = text;
}

- (void)setTextColor:(UIColor *)textColor{
    super.textColor = textColor;
    
    [self textLayer].foregroundColor = textColor.CGColor;
}

- (void)setFont:(UIFont *)font{
    super.font = font;
    
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    [self textLayer].font = fontRef;
    [self textLayer].fontSize = font.pointSize;
    
    CGFontRelease(fontRef);
}


@end
