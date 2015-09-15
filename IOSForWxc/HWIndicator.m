//
//  HWIndicator.m
//  IOSForWxc
//
//  Created by Jacky on 15/9/15.
//  Copyright (c) 2015年 Jacky. All rights reserved.
//

#import "HWIndicator.h"

@implementation HWIndicator

-(HWIndicator *) init{
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    return (HWIndicator *) indicator;
}



-(void) show{
    
    [(UIActivityIndicatorView *)self startAnimating];
}
-(void) hide{
    [(UIActivityIndicatorView *)self stopAnimating];
}

@end
