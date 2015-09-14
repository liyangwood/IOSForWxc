//
//  FirstViewController.h
//  IOSForWxc
//
//  Created by Jacky on 15/9/14.
//  Copyright (c) 2015年 Jacky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MKNetworkKit/MKNetworkEngine.h>
#import <MKNetworkKit/MKNetworkOperation.h>

@interface FirstViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>


@property (strong) NSArray *dataList;

@end

