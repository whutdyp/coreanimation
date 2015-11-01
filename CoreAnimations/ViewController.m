//
//  ViewController.m
//  CoreAnimations
//
//  Created by  tomxiang on 15/10/13.
//  Copyright © 2015年 tomxiang. All rights reserved.
//

#import "ViewController.h"
#import "QQTransitionController.h"
#import "UIButton+Custom.h"
#import "QQBaseController.h"
#import "QQKeyController.h"
#import "QQGroupController.h"
#import "QQShapeController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)loadView
{
    [super loadView];
    self.title = @"主页";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton createButton:@"QQTransitionController" target:self action:@selector(jumpToTransitionController)];
    button.frame = CGRectMake(80, 100, 200, 100);

    [self.view addSubview:button];

    UIButton *buttonBase = [UIButton createButton:@"QQBaseController" target:self action:@selector(jumpToQQBaseController)];
    buttonBase.frame = CGRectMake(80, 200, 200, 100);
    
    [self.view addSubview:buttonBase];
    
    UIButton *buttonKey = [UIButton createButton:@"QQKeyController" target:self action:@selector(jumpToQQKeyController)];
    buttonKey.frame = CGRectMake(80, 300, 200, 100);
    
    [self.view addSubview:buttonKey];
    
    
    UIButton *buttonGroup = [UIButton createButton:@"QQGroupController" target:self action:@selector(jumpToQQGroupController)];
    buttonGroup.frame = CGRectMake(80, 400, 200, 100);
    
    [self.view addSubview:buttonGroup];
    
    
    UIButton *buttonShape = [UIButton createButton:@"QQShapeController" target:self action:@selector(jumpToQQShapeController)];
    buttonShape.frame = CGRectMake(80, 500, 200, 100);
    
    [self.view addSubview:buttonShape];
    
}

-(void) jumpToTransitionController
{
    QQTransitionController* qqtransV = [[QQTransitionController alloc] init];
    qqtransV.title = @"QQTransitionController首页";
    [self.navigationController pushViewController:qqtransV animated:YES];
}

-(void) jumpToQQBaseController
{
    QQBaseController* qqtransV = [[QQBaseController alloc] init];
    qqtransV.title = @"QQBaseController首页";
    [self.navigationController pushViewController:qqtransV animated:YES];
}

-(void) jumpToQQKeyController
{
    QQKeyController* qqtransV = [[QQKeyController alloc] init];
    qqtransV.title = @"QQKeyController首页";
    [self.navigationController pushViewController:qqtransV animated:YES];
}

-(void) jumpToQQGroupController
{
    QQGroupController *qqGroup = [[QQGroupController alloc] init];
    qqGroup.title = @"Group首页";
    [self.navigationController pushViewController:qqGroup animated:YES];
}

-(void) jumpToQQShapeController
{
    QQShapeController *qqShape = [[QQShapeController alloc] init];
    qqShape.title = @"Shape首页";
    [self.navigationController pushViewController:qqShape animated:YES];
}


@end
