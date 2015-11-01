//
//  QQGroupController.m
//  CoreAnimations
//
//  Created by  tomxiang on 15/10/13.
//  Copyright © 2015年 tomxiang. All rights reserved.
//http://blog.csdn.net/iunion/article/details/26221213

#import "QQGroupController.h"
#import "UIButton+Custom.h"

@interface QQGroupController()
@property(nonatomic,strong) UIView *viewRect;
@end
@implementation QQGroupController

-(void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton createButton:@"开始动画" target:self action:@selector(buttonConfirm)];
    button.frame = CGRectMake(80, 100, 200, 40);
    [self.view addSubview:button];
    
    self.viewRect = [[UIView alloc] initWithFrame:CGRectMake(40, 250, 100, 100)];
    self.viewRect.backgroundColor = [UIColor redColor];
    [self.view addSubview:_viewRect];
}

-(void) buttonConfirm
{
    [self startAnimations];
}

-(void) startAnimations
{
    CAAnimationGroup *group = [self createGroupAnimation];
    [self.viewRect.layer addAnimation:group forKey:NULL];
}

- (CAAnimationGroup *)createGroupAnimation
{
    //贝塞尔曲线路径
    UIBezierPath *movePath = [UIBezierPath bezierPath];
    [movePath moveToPoint:CGPointMake(10.0, 10.0)];
    [movePath addQuadCurveToPoint:CGPointMake(100, 300) controlPoint:CGPointMake(300, 100)];
    
    //路径动画
    CAKeyframeAnimation * posAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    posAnim.path = movePath.CGPath;
    posAnim.removedOnCompletion = YES;
    
    //缩放动画
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    scaleAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)];
    scaleAnim.removedOnCompletion = YES;
    
    //透明动画
    CABasicAnimation *opacityAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnim.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnim.toValue = [NSNumber numberWithFloat:0.1];
    opacityAnim.removedOnCompletion = NO;
    
    //动画组
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.animations = [NSArray arrayWithObjects:posAnim, scaleAnim, opacityAnim, nil];
    animGroup.duration = 1;
    animGroup.removedOnCompletion = NO;
    animGroup.fillMode = kCAFillModeForwards;
    
    return animGroup;
}

@end
