//
//  QQCircleViewController.m
//  CoreAnimations
//
//  Created by  tomxiang on 15/10/15.
//  Copyright © 2015年 tomxiang. All rights reserved.
//

#import "QQCircleViewController.h"

@implementation QQCircleViewController

-(void) viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    
    UIBezierPath *pathRect = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 50, 50)];

    UIBezierPath *pathOval= [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 50, 100)];

    UIBezierPath *pathCircle= [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100) cornerRadius:50];

    
    
    [self createPath:pathRect.CGPath rect:CGRectMake(100, 100, 50, 50)];
    
    [self createPath:pathOval.CGPath rect:CGRectMake(100, 200, 50, 100)];

    [self createPath:pathCircle.CGPath rect:CGRectMake(100, 400, 100, 100)];

}

-(void) createPath:(CGPathRef) cgPath rect:(CGRect) rect
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = rect;
    shapeLayer.borderColor = [UIColor redColor].CGColor;
    shapeLayer.borderWidth = 2.F;
    shapeLayer.fillColor = [UIColor orangeColor].CGColor;
    
    //    shapeLayer.position = self.view.center;
    shapeLayer.path = cgPath;
    // 禁止内容显示超出CAShapeLayer的frame值
    shapeLayer.masksToBounds = YES;
    
    [self.view.layer addSublayer:shapeLayer];
}

@end
