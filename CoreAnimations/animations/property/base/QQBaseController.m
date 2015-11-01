//
//  QQBaseController.m
//  CoreAnimations
//
//  Created by  tomxiang on 15/10/13.
//  Copyright © 2015年 tomxiang. All rights reserved.
//  http://www.cnblogs.com/monicaios/p/3521575.html
//  http://blog.csdn.net/iosevanhuang/article/details/14488239


#import "QQBaseController.h"
#import "UIButton+Custom.h"

@interface QQBaseController()
@property(nonatomic,strong) UIView *viewRect;
@property(nonatomic,copy) NSArray *arrayColors;
@end


@implementation QQBaseController

-(instancetype)init
{
    if (self = [super init]) {
        _arrayColors = @[[UIColor greenColor],[UIColor redColor],[UIColor grayColor],[UIColor blackColor],[UIColor blueColor]];
    }
    return self;
}

-(void)loadView
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton createButton:@"移动" target:self action:@selector(changeViewOne)];
    button.frame = CGRectMake(80, 60, 100, 40);
    [self.view addSubview:button];
    
    UIButton *button2 = [UIButton createButton:@"旋转" target:self action:@selector(changeViewTwo)];
    button2.frame = CGRectMake(180, 60, 100, 40);
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton createButton:@"缩放" target:self action:@selector(changeViewThree)];
    button3.frame = CGRectMake(80, 100, 100, 40);
    [self.view addSubview:button3];
    
    UIButton *button4 = [UIButton createButton:@"组合" target:self action:@selector(changeViewFour)];
    button4.frame = CGRectMake(180, 100, 100, 40);
    [self.view addSubview:button4];
    
    
    self.viewRect = [[UIView alloc] initWithFrame:CGRectMake(40, 250, 100, 100)];
    self.viewRect.backgroundColor = [UIColor redColor];
    [self.view addSubview:_viewRect];
}

#pragma mark- 移动
-(void) changeViewOne
{
    /* 移动 */
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    
    // 动画选项的设定
    animation.duration = 2.5; // 持续时间
    animation.repeatCount = 1; // 重复次数
    
    // 起始帧和终了帧的设定
    animation.fromValue = [NSValue valueWithCGPoint:self.viewRect.layer.position]; // 起始帧
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(320, 480)]; // 终了帧
    
    animation.autoreverses = YES; // 动画结束时执行逆动画
    
    // 动画终了后不返回初始状态
//    animation.removedOnCompletion = NO;
//    animation.fillMode = kCAFillModeForwards;
    
    // 添加动画
    [self.viewRect.layer addAnimation:animation forKey:@"move-layer"];
}
#pragma mark- 旋转
-(void) changeViewTwo
{
    /* 旋转 */
    
    // 对Y轴进行旋转（指定Z轴的话，就和UIView的动画一样绕中心旋转）
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    
    // 设定动画选项
    animation.duration = 2.5; // 持续时间
    animation.repeatCount = 1; // 重复次数
    
    // 设定旋转角度
    animation.fromValue = [NSNumber numberWithFloat:0.0]; // 起始角度
    animation.toValue = [NSNumber numberWithFloat:2 * M_PI/3]; // 终止角度
    
    // 动画终了后不返回初始状态
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    // 添加动画
    [self.viewRect.layer addAnimation:animation forKey:@"rotate-layer"];
    
    
//    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//    animation.duration = 1;
//    animation.repeatCount = CGFLOAT_MAX;
//    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
//    animation.fromValue = [NSNumber numberWithFloat:0];
//    animation.toValue = [NSNumber numberWithFloat:2 * M_PI];
//    [self.viewRect.layer addAnimation:animation forKey:@"rotate"];
}
#pragma mark- 缩放
-(void) changeViewThree
{
//    [UIView setAnimationsEnabled:NO];
    // 设定为缩放
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    // 动画选项设定
    animation.duration = 2.5; // 动画持续时间
    animation.repeatCount = 1; // 重复次数
    animation.autoreverses = YES; // 动画结束时执行逆动画
    
    // 缩放倍数
    animation.fromValue = [NSNumber numberWithFloat:1.0]; // 开始时的倍率
    animation.toValue = [NSNumber numberWithFloat:2.0];   // 结束时的倍率
    
    // 添加动画
    [self.viewRect.layer addAnimation:animation forKey:NULL];
//    [UIView setAnimationsEnabled:YES];
}
#pragma mark- 组合
-(void) changeViewFour
{
    /* 动画1（在X轴方向移动） */
    CABasicAnimation *animation1 =
    [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    // 终点设定
    animation1.toValue = [NSNumber numberWithFloat:80];; // 終点
    
    /* 动画2（绕Z轴中心旋转） */
    CABasicAnimation *animation2 =
    [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    // 设定旋转角度
    animation2.fromValue = [NSNumber numberWithFloat:0.0]; // 开始时的角度
    animation2.toValue = [NSNumber numberWithFloat:2 * M_PI]; // 结束时的角度
    
    /* 动画组 */
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    // 动画选项设定
    group.duration = 3.0;
    group.repeatCount = 1;
    group.autoreverses = YES;
    
    // 添加动画
    group.animations = [NSArray arrayWithObjects:animation1, animation2, nil];
    [self.viewRect.layer addAnimation:group forKey:@"move-rotate-layer"];
}




@end
