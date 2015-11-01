//
//  UIButton+Custom.m
//  CoreAnimations
//
//  Created by  tomxiang on 15/10/13.
//  Copyright © 2015年 tomxiang. All rights reserved.
//

#import "UIButton+Custom.h"

#define kDefaultTitleColor               [UIColor colorWithRed:102.0f/255.0f green:96.0f/255.0f blue:91.0f/255.0f alpha:1]


@implementation UIButton (Custom)

+ (UIButton*)createButton:(NSString*) title target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:kDefaultTitleColor forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

@end
