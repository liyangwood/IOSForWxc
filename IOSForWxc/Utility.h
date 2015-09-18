//
//  Utility.h
//  IOSForWxc
//
//  Created by Jacky on 15/9/15.
//  Copyright (c) 2015年 Jacky. All rights reserved.
//


#import "GlobalConfig.h"
#import <MKNetworkKit/MKNetworkEngine.h>
#import <MKNetworkKit/MKNetworkOperation.h>

typedef void (^requestSuccessBlock)(NSDictionary *data);
typedef void (^requestErrorBlock)(NSError *error);


@interface Utility : NSObject


+(UIActivityIndicatorView *) getIndicator : (UIView *) view;

+(void) requestByGet : (NSString *) url
             success : (requestSuccessBlock) successHandler
               error : (requestErrorBlock) errorHandler
              option : (NSDictionary *) option;


@end
