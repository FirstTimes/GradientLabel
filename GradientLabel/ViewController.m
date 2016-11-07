//
//  ViewController.m
//  GradientLabel
//
//  Created by 李锐 on 2016/11/6.
//  Copyright © 2016年 lirui. All rights reserved.
//

#import "ViewController.h"
#import "GradientLabel.h"

@interface ViewController ()

@property (nonatomic,strong) GradientLabel * label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.label = [[GradientLabel alloc]init];
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.label];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[label]-15-|" options:NSLayoutFormatDirectionLeftToRight metrics:nil views:@{@"label":self.label}]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label(80)]" options:NSLayoutFormatDirectionLeftToRight metrics:nil views:@{@"label":self.label}]];
    
    self.label.text = @"我是一个有色彩渐变特效的标签";
    self.label.type = GradientColourFade;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
