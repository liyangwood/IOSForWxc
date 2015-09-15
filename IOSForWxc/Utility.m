//
//  Utility.m
//  IOSForWxc
//
//  Created by Jacky on 15/9/15.
//  Copyright (c) 2015年 Jacky. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+(UIActivityIndicatorView *) getIndicator : (UIView *) view{
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];

    [indicator setCenter:view.center];
    [indicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    indicator.backgroundColor = [UIColor blackColor];
    indicator.alpha = 0.5;
    [view addSubview:indicator];
    
    return indicator;
}

@end
