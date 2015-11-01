//
//  QQShapeController.m
//  CoreAnimations
//
//  Created by  tomxiang on 15/10/15.
//  Copyright © 2015年 tomxiang. All rights reserved.
//

#import "QQShapeController.h"
#import "UIButton+Custom.h"
#import "QQCircleViewController.h"
#import "QQCircleBordViewController.h"
#import "PathAnimationController.h"
#import "FontViewController.h"

@implementation QQShapeController

-(void)loadView
{
    [super loadView];

    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton createButton:@"绘制各种形状" target:self action:@selector(drawCircle)];
    button.frame = CGRectMake(80, 100, 200, 100);
    
    [self.view addSubview:button];
    
    UIButton *buttonBase = [UIButton createButton:@"圆圈边框stroke" target:self action:@selector(drawCircleStroke)];
    buttonBase.frame = CGRectMake(80, 200, 200, 100);
    
    [self.view addSubview:buttonBase];
    
    UIButton *buttonKey = [UIButton createButton:@"PathAnimation" target:self action:@selector(jumpToPathAnimation)];
    buttonKey.frame = CGRectMake(80, 300, 200, 100);
    
    [self.view addSubview:buttonKey];
    
    
    UIButton *buttonGroup = [UIButton createButton:@"FontViewController" target:self action:@selector(jumpToFontViewAnimation)];
    buttonGroup.frame = CGRectMake(80, 400, 200, 100);
    
    [self.view addSubview:buttonGroup];
    
}

-(void) drawCircle
{
    QQCircleViewController *vc = [[QQCircleViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void) drawCircleStroke
{
    QQCircleBordViewController *vc = [[QQCircleBordViewController  alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void) jumpToPathAnimation
{
    PathAnimationController *vc = [[PathAnimationController  alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void) jumpToFontViewAnimation
{
    FontViewController *vc = [[FontViewController  alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
