//
//  FirstViewController.h
//  IOSForWxc
//
//  Created by Jacky on 15/9/14.
//  Copyright (c) 2015年 Jacky. All rights reserved.
//


@interface FirstViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>


@property (strong, nonatomic) NSArray *dataList;
@property (strong, nonatomic) UIActivityIndicatorView *indicator;

@end

