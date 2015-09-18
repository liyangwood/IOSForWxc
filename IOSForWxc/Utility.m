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

+(void) requestByGet:(NSString *)url
             success:(requestSuccessBlock)successHandler
               error:(requestErrorBlock)errorHandler
              option:(NSDictionary *)option{
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:API_HOST
                                                     customHeaderFields:nil];
    MKNetworkOperation *op = [engine operationWithPath:url];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        NSData *data = [completedOperation responseData];
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
        successHandler(json);
        
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        log(@"[ERROR] ---- %@", [error localizedDescription]);
        errorHandler(error);
    }];
    
    [engine enqueueOperation:op];

}



@end
