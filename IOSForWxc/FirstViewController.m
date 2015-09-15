//
//  FirstViewController.m
//  IOSForWxc
//
//  Created by Jacky on 15/9/14.
//  Copyright (c) 2015年 Jacky. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tb;

@end

@implementation FirstViewController

@synthesize indicator;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    

    
    //self.tb = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    
    self.tb.rowHeight = 40;

    self.tb.delegate = self;
    
    
    //init indicator
    if(nil == indicator){
        indicator = [Utility getIndicator:self.view];
    
    }
    
    [indicator startAnimating];
    [self startLoadData];
    self.tb.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UITableViewDataSource
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    NSLog(@"%ld====%@", (long)indexPath.row, self.dataList[indexPath.row]);
    NSDictionary *rs = self.dataList[indexPath.row];
    cell.textLabel.text = [rs objectForKey:@"title"];
    if([rs objectForKey:@"images"]){
        NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[rs objectForKey:@"images"][0]]];
        cell.imageView.image = [UIImage imageWithData:imgData];
    }
    
    return cell;
}

-(void) startLoadData{
    NSString *url = @"/service/api/?act=index&channel=news&pagesize=25&version=2&format=json";
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:@"api.wenxuecity.com" customHeaderFields:nil];
    
    MKNetworkOperation *op = [engine operationWithPath:url];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        NSData *data = [completedOperation responseData];
        NSDictionary *list = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        self.dataList = [list objectForKey:@"list"];
        
        
        [indicator stopAnimating];
        [self.tb reloadData];
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        NSLog(@"===");
    }];
    
    [engine enqueueOperation:op];
    
}



@end
