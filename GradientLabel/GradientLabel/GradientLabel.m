//
//  GradientLabel.m
//  渐变动画
//
//  Created by 李锐 on 2016/11/4.
//  Copyright © 2016年 lirui. All rights reserved.
//

#import "GradientLabel.h"

@interface GradientLabel()

@property (nonatomic,strong) CAGradientLayer * gradientLayer;

@end

@implementation GradientLabel

- (instancetype)init{
    if (self = [super init]){
        self.textColor = [UIColor blackColor];
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:24.0];
        self.type = GradientFlash;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]){
        self.textColor = [UIColor blackColor];
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:24.0];
        self.type = GradientFlash;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        self.textColor = [UIColor blackColor];
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:24.0];
        self.type = GradientFlash;
    }
    return self;
}

- (void)initGradientLayer {
    self.backgroundColor = self.superview.backgroundColor;
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.startPoint = CGPointMake(0, 0.5);
    self.gradientLayer.endPoint = CGPointMake(1, 0.5);
    switch (self.type) {
        case GradientFlash:
        {
            NSArray * colors = @[(__bridge id)self.textColor.CGColor,
                                 (__bridge id)[UIColor whiteColor].CGColor,
                                 (__bridge id)self.textColor.CGColor];
            self.gradientLayer.colors = colors;
            
            NSArray * locations = @[@(0.25),@(0.50),@(0.75)];
            self.gradientLayer.locations = locations;
        }
            break;
        case GradientFade:
        {
            NSArray * colors = @[(__bridge id)[UIColor clearColor].CGColor,
                                 (__bridge id)self.textColor.CGColor,
                                 (__bridge id)[UIColor clearColor].CGColor];
            self.gradientLayer.colors = colors;
            
            NSArray * locations = @[@(0.25),@(0.50),@(0.75)];
            self.gradientLayer.locations = locations;
        }
            break;
        case GradientColour:
        {
            NSArray * colors = @[(__bridge id)[UIColor redColor].CGColor,
                                 (__bridge id)[UIColor yellowColor].CGColor,
                                 (__bridge id)[UIColor blueColor].CGColor,
                                 (__bridge id)[UIColor redColor].CGColor];
            self.gradientLayer.colors = colors;
            
            NSArray * locations = @[@(0.2),@(0.4),@(0.6),@(0.8)];
            self.gradientLayer.locations = locations;
        }
            break;
        case GradientColourFade:
        {
            NSArray * colors = @[(__bridge id)[UIColor clearColor].CGColor,
                                 (__bridge id)[UIColor redColor].CGColor,
                                 (__bridge id)[UIColor yellowColor].CGColor,
                                 (__bridge id)[UIColor blueColor].CGColor,
                                 (__bridge id)[UIColor clearColor].CGColor];
            self.gradientLayer.colors = colors;
            
            NSArray * locations = @[@(1/6),@(2/6),@(3/6),@(4/6),@(5/6)];
            self.gradientLayer.locations = locations;
        }
            break;
        case GradientRainbow:
        {
            NSArray * colors = @[(__bridge id)[UIColor redColor].CGColor,
                                 (__bridge id)[UIColor orangeColor].CGColor,
                                 (__bridge id)[UIColor yellowColor].CGColor,
                                 (__bridge id)[UIColor greenColor].CGColor,
                                 (__bridge id)[UIColor blueColor].CGColor,
                                 (__bridge id)[UIColor cyanColor].CGColor,
                                 (__bridge id)[UIColor purpleColor].CGColor,
                                 (__bridge id)[UIColor redColor].CGColor];
            self.gradientLayer.colors = colors;
            
            NSArray * locations = @[@(1/9),@(2/9),@(3/9),@(4/9),@(5/9),@(6/9),@(7/9),@(8/9)];
            self.gradientLayer.locations = locations;
        }
            break;

        default:
            break;
    }
    self.gradientLayer.frame = CGRectMake(- self.bounds.size.width, 0, 3 * self.bounds.size.width, self.bounds.size.height);
    [self.layer addSublayer:self.gradientLayer];
    
}

- (void)layoutSubviews{
    [self initGradientLayer];
    [self gradientAnimation];
}

#pragma mark - 渐变动画
- (void)gradientAnimation {
    CABasicAnimation * anim = [CABasicAnimation animationWithKeyPath:@"locations"];
    
    switch (self.type) {
        case GradientFlash:
            anim.fromValue = @[@(0.0),@(0.0),@(0.5)];
            anim.toValue = @[@(0.5),@(1.0),@(1.0)];
            break;
        case GradientFade:
            anim.fromValue = @[@(0.0),@(0.0),@(0.25)];
            anim.toValue = @[@(0.75),@(1.0),@(1.0)];
            break;
        case GradientColour:
            anim.fromValue = @[@(0.0),@(0.0),@(0.2),@(0.4)];
            anim.toValue = @[@(0.6),@(0.8),@(1.0),@(1.0)];
            break;
        case GradientColourFade:
            anim.fromValue = @[@(0.0),@(0.08),@(0.16),@(0.24),@(0.32)];
            anim.toValue = @[@(0.68),@(0.76),@(0.84),@(0.92),@(1.0)];
            break;
        case GradientRainbow:
            anim.fromValue = @[@(0.0),@(0.05),@(0.1),@(0.15),@(0.2),@(0.25),@(0.3),@(0.35)];
            anim.toValue = @[@(0.65),@(0.7),@(0.75),@(0.8),@(0.85),@(0.9),@(0.95),@(1.0)];
            break;
        default:
            break;
    }

    anim.duration = 3.0;
    anim.repeatCount = CGFLOAT_MAX;
    anim.removedOnCompletion = NO;
    [self.gradientLayer addAnimation:anim forKey:@"Gradient"];
}

#pragma mark - 文字图层
//由于自定义的GradientLabel是UIView，所以它没有text属性，所以我自定义一个text属性，然后重绘图层，并作为gradientLayer的mask。

- (void)setText:(NSString *)text{
    _text = [text copy];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    UIGraphicsBeginImageContextWithOptions(self.frame.size, false, 0);
    NSMutableParagraphStyle * style = [[NSMutableParagraphStyle alloc]init];
    style.alignment = self.textAlignment;
    NSDictionary * dict = @{NSFontAttributeName : self.font, NSParagraphStyleAttributeName : style};
    [self.text drawInRect:self.bounds withAttributes:dict];
    
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CALayer * maskLayer = [CALayer layer];
    maskLayer.backgroundColor = [UIColor clearColor].CGColor;
    maskLayer.frame = CGRectOffset(self.bounds, self.bounds.size.width, 0);
    maskLayer.contents = (__bridge id)(image.CGImage);
    self.gradientLayer.mask = maskLayer;
}

@end
