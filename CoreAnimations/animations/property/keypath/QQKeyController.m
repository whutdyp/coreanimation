//
//  QQKeyController.m
//  CoreAnimations
//
//  Created by  tomxiang on 15/10/13.
//  Copyright © 2015年 tomxiang. All rights reserved.
//http://geeklu.com/2012/09/animation-in-ios/
//http://blog.csdn.net/samuelltk/article/details/9048325
//•calculationMode目前提供如下几种模式：
//–kCAAnimationLinear 默认值，表示当关键帧为座标点的时候，关键帧之间直接直线相连进行插值计算
//–kCAAnimationDiscrete 离散的，不进行插值计算，所有关键帧直接逐个进行显示
//–kCAAnimationPaced 使得动画均匀进行，而不是按keyTimes设置的或者按关键帧平分时间，此时keyTimes和timingFunctions无效
//–kCAAnimationCubic 对关键帧为座标点的关键帧进行圆滑曲线相连后插值计算，这里的主要目的是使得运行的轨迹变得圆滑
//–kCAAnimationCubicPaced 看这个名字就知道和kCAAnimationCubic有一定联系,其实就是在kCAAnimationCubic的基础上使得动画运行变得均匀，就是系统时间内运动的距离相同，此时keyTimes以及timingFunctions也是无效的


//1 const kCAAnimationLinear//线性，默认
//2 const kCAAnimationDiscrete//离散，无中间过程，但keyTimes设置的时间依旧生效，物体跳跃地出现在各个关键帧上
//3 const kCAAnimationPaced//平均，keyTimes跟timeFunctions失效
//4 const kCAAnimationCubic//平均，同上
//5 const kCAAnimationCubicPaced//平均，同上

#import "QQKeyController.h"
#import "UIButton+Custom.h"

@interface QQKeyController()
@property(nonatomic,strong) UIView *viewRect;
@end

@implementation QQKeyController

-(void)loadView
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton createButton:@"path" target:self action:@selector(changeViewOne)];
    button.frame = CGRectMake(80, 60, 100, 40);
    [self.view addSubview:button];
    
    UIButton *button2 = [UIButton createButton:@"3D缩放效果" target:self action:@selector(changeViewTwo)];
    button2.frame = CGRectMake(180, 60, 100, 40);
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton createButton:@"移动" target:self action:@selector(changeViewThree)];
    button3.frame = CGRectMake(80, 100, 100, 40);
    [self.view addSubview:button3];
    
    UIButton *button4 = [UIButton createButton:@"旋转" target:self action:@selector(changeViewFour)];
    button4.frame = CGRectMake(180, 100, 100, 40);
    [self.view addSubview:button4];
    
    self.viewRect = [[UIView alloc] initWithFrame:CGRectMake(40, 250, 50, 50)];
    self.viewRect.backgroundColor = [UIColor redColor];
    [self.view addSubview:_viewRect];
    
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 280, 300, 30)];
    lab.text = @"hello  kevin Jin,hello objective-c";
    lab.textColor = [UIColor blueColor];
    lab.font = [UIFont systemFontOfSize:20];
    lab.tag = 100;
    [self.view addSubview:lab];
}

-(void) changeViewOne
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(-40, 100)];
    [path addLineToPoint:CGPointMake(360, 100)];
    [path addLineToPoint:CGPointMake(360, 200)];
    [path addLineToPoint:CGPointMake(-40, 200)];
    [path addLineToPoint:CGPointMake(-40, 300)];
    [path addLineToPoint:CGPointMake(360, 300)];
    
    CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnimation.path = path.CGPath; //是关键
    moveAnimation.duration = 2.0f;
    moveAnimation.rotationMode = kCAAnimationDiscrete;
//    kCAAnimationPaced kCAAnimationCubic :使得keytimes无效
    [moveAnimation setKeyTimes:[NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.1], [NSNumber numberWithFloat:0.50],[NSNumber numberWithFloat:0.65], [NSNumber numberWithFloat:0.7],[NSNumber numberWithFloat:1.0], nil]];
    
    [self.viewRect.layer addAnimation:moveAnimation forKey:@"moveAnimation"];
    
//    [self.viewRect.layer addAnimation:animation forKey:NULL];
}

-(void) changeViewTwo
{
    ///CAKeyframeAnimation 对象
    CAKeyframeAnimation *bounce = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    ///设置动画
    CATransform3D forward = CATransform3DMakeScale(1.3, 1.3, 1);
    CATransform3D back = CATransform3DMakeScale(0.7, 0.7, 1);
    CATransform3D forward2 = CATransform3DMakeScale(1.2, 1.2, 1);
    CATransform3D back2 = CATransform3DMakeScale(0.9, 0.9, 1);
    
    [bounce setValues:[NSArray arrayWithObjects:
                       [NSValue valueWithCATransform3D:CATransform3DIdentity],
                       [NSValue valueWithCATransform3D:forward],
                       [NSValue valueWithCATransform3D:back],
                       [NSValue valueWithCATransform3D:forward2],
                       [NSValue valueWithCATransform3D:back2],
                       [NSValue valueWithCATransform3D:CATransform3DIdentity],nil]];
    
    [bounce setDuration:1];
    
    UILabel *temp = (UILabel *) [self.view viewWithTag:100];
    [temp.layer addAnimation:bounce forKey:NULL];
    [self.viewRect.layer addAnimation:bounce forKey:NULL];
}

-(void) changeViewThree
{
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, 50.0, 120.0);
    CGPathAddCurveToPoint(path, NULL, 50.0, 275.0, 150.0, 275.0, 150.0, 120.0);
    CGPathAddCurveToPoint(path,NULL,150.0,275.0,250.0,275.0,250.0,120.0);
    CGPathAddCurveToPoint(path,NULL,250.0,275.0,350.0,275.0,350.0,120.0);
    CGPathAddCurveToPoint(path,NULL,350.0,275.0,450.0,275.0,450.0,120.0);
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [anim setPath:path];
    [anim setDuration:3.0];
    [anim setAutoreverses:YES];
    CFRelease(path);
    [self.viewRect.layer addAnimation:anim forKey:@"path"];
}

-(void) changeViewFour
{
    CAKeyframeAnimation *keyAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    CATransform3D rotation1 = CATransform3DMakeRotation(30 * M_PI/180, 0, 0, -1);
    CATransform3D rotation2 = CATransform3DMakeRotation(60 * M_PI/180, 0, 0, -1);
    CATransform3D rotation3 = CATransform3DMakeRotation(90 * M_PI/180, 0, 0, -1);
    CATransform3D rotation4 = CATransform3DMakeRotation(120 * M_PI/180, 0, 0, -1);
    CATransform3D rotation5 = CATransform3DMakeRotation(150 * M_PI/180, 0, 0, -1);
    CATransform3D rotation6 = CATransform3DMakeRotation(180 * M_PI/180, 0, 0, -1);
    
    [keyAnim setValues:[NSArray arrayWithObjects:
                        [NSValue valueWithCATransform3D:rotation1],
                        [NSValue valueWithCATransform3D:rotation2],
                        [NSValue valueWithCATransform3D:rotation3],
                        [NSValue valueWithCATransform3D:rotation4],
                        [NSValue valueWithCATransform3D:rotation5],
                        [NSValue valueWithCATransform3D:rotation6],
                        nil]];
    [keyAnim setKeyTimes:[NSArray arrayWithObjects:
                          [NSNumber numberWithFloat:0.0],
                          [NSNumber numberWithFloat:0.2f],
                          [NSNumber numberWithFloat:0.4f],
                          [NSNumber numberWithFloat:0.6f],
                          [NSNumber numberWithFloat:0.8f],
                          [NSNumber numberWithFloat:1.0f],
                          nil]];
    [keyAnim setDuration:4];
    [keyAnim setFillMode:kCAFillModeForwards];
    [keyAnim setRemovedOnCompletion:NO];
    [self.viewRect.layer addAnimation:keyAnim forKey:nil];
}

@end
