//
//  QQTransitionController.m
//  CoreAnimations
//
//  Created by  tomxiang on 15/10/13.
//  Copyright © 2015年 tomxiang. All rights reserved.
//

#import "QQTransitionController.h"
#import "UIButton+Custom.h"

@interface QQTransitionController()
@property(nonatomic,strong) UIView *viewRect;
@property(nonatomic,copy) NSArray *arrayColors;
@end
/*
 pageCurl            向上翻一页
 pageUnCurl          向下翻一页
 rippleEffect        滴水效果
 suckEffect          收缩效果，如一块布被抽走
 cube                立方体效果
 oglFlip             上下翻转效果
 */
//http://blog.csdn.net/devday/article/details/6592634

@implementation QQTransitionController

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
    
    UIButton *button = [UIButton createButton:@"改变导航栏标题" target:self action:@selector(changeNavBarTitle)];
    button.frame = CGRectMake(80, 60, 200, 40);
    [self.view addSubview:button];
    
    self.viewRect = [[UIView alloc] initWithFrame:CGRectMake(80, 250, 100, 100)];
    self.viewRect.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_viewRect];
    
    UIButton *button2 = [UIButton createButton:@"改变小view" target:self action:@selector(changeSmallView)];
    button2.frame = CGRectMake(80, 100, 200, 40);
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton createButton:@"切换视图" target:self action:@selector(changeView)];
    button3.frame = CGRectMake(80, 140, 200, 40);
    [self.view addSubview:button3];
    
}

-(void) changeNavBarTitle
{
    CATransition *animation = [CATransition animation];
    animation.duration = 0.5;
    animation.type = kCATransitionFade;//过渡效果
    animation.subtype = kCATransitionFromRight;//过渡方向
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];//样式
    [self.navigationController.navigationBar.layer addAnimation: animation forKey: @"changeTextTransition"];
    self.navigationController.navigationBar.topItem.title = @"new标题";
}

-(void) changeSmallView
{
    CATransition * transition = [CATransition animation];
    transition.duration = 1.0;//动画间隔
    transition.type = kCATransitionReveal;//主要种类，决定动画效果
    transition.startProgress = 0.0;//开始
    transition.endProgress = 1.0;//结束
    transition.subtype = kCATransitionFromRight;//次要种类，决定动画方向
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];//时间函数
    [self.viewRect.layer addAnimation:transition forKey:@"ToNext"];

    srand((unsigned)time(0));
    int i = rand() % 5;
    self.viewRect.backgroundColor = _arrayColors[i];
}

-(void) changeView
{
    CATransition * transition = [CATransition animation];
    transition.duration = 1.0;//动画间隔
    transition.type = kCATransitionReveal;//oglFlip 主要种类，决定动画效果
    transition.startProgress = 0.0;//开始
    transition.endProgress = 1.0;//结束
    transition.subtype = kCATransitionFromRight;//次要种类，决定动画方向
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];//时间函数
    [self.viewRect.layer addAnimation:transition forKey:@"ToNext"];
 
    srand((unsigned)time(0));
    int i = rand() % 5;
    
    self.view.backgroundColor = _arrayColors[i];
    [[self.view layer] addAnimation:transition forKey:@"animation"];
}

@end
