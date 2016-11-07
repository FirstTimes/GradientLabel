//
//  GradientLabel.h
//  渐变动画
//
//  Created by 李锐 on 2016/11/4.
//  Copyright © 2016年 lirui. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum:NSInteger {
    GradientFlash = 0,
    GradientFade,
    GradientColour,
    GradientColourFade,
    GradientRainbow
} GradientType;

@interface GradientLabel : UIView

@property (nonatomic,copy) NSString * text; // default is nil

@property (nonatomic,strong) UIColor * textColor; // default is black

@property(nonatomic) NSTextAlignment textAlignment; // default is NSTextAlignmentCenter

@property(nonatomic,strong) UIFont * font;   // default is nil (system font 17 plain)

@property (nonatomic,assign) GradientType type;

@end
