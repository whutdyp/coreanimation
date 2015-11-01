//
//  QQCircleBordViewController.m
//  CoreAnimations
//
//  Created by  tomxiang on 15/10/15.
//  Copyright © 2015年 tomxiang. All rights reserved.
//

#import "QQCircleBordViewController.h"

@interface QQCircleBordViewController()
@property(nonatomic,strong) CAShapeLayer *shapeLayer;
@property (nonatomic, strong) NSTimer      *timer;
@end

@implementation QQCircleBordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 创建shapeLayer
    UIBezierPath *pathOval= [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];

    self.shapeLayer= [self createPath:pathOval.CGPath rect:CGRectMake(0, 0, 100, 100)];

    [self.view.layer addSublayer:_shapeLayer];
    
    // 给这个layer添加动画效果
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 1;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.f];
    pathAnimation.repeatCount = INT_MAX;
    [self.shapeLayer addAnimation:pathAnimation forKey:nil];

}

-(CAShapeLayer*) createPath:(CGPathRef) cgPath rect:(CGRect) rect
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = rect;
    shapeLayer.fillColor = [UIColor orangeColor].CGColor;
    shapeLayer.lineWidth   = 5.f;
    
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.strokeStart = 0;
    shapeLayer.strokeEnd   = 0;
    
    shapeLayer.position = self.view.center;
    shapeLayer.path = cgPath;
    // 禁止内容显示超出CAShapeLayer的frame值
//    shapeLayer.masksToBounds = YES;
    return shapeLayer;
}

@end
