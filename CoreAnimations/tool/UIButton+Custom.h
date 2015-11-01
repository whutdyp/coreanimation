//
//  UIButton+Custom.h
//  CoreAnimations
//
//  Created by  tomxiang on 15/10/13.
//  Copyright © 2015年 tomxiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Custom)

+ (UIButton*)createButton:(NSString*) title target:(id)target action:(SEL)action;

@end
