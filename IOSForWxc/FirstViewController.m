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
    
    
    self.tb.rowHeight = 80;

    self.tb.dataSource = self;
    self.tb.delegate = self;
    
    
    //init indicator
    if(nil == indicator){
        indicator = [Utility getIndicator:self.view];
    }
    

    
    [indicator startAnimating];
    [self startLoadData];
    
    
    
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
    
    static NSString *NOTIFY = @"reuse_cell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:NOTIFY];
    
    if(nil == cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:NOTIFY];
    }
    
    
    //log(@"%ld====%@", (long)indexPath.row, self.dataList[indexPath.row]);
    NSDictionary *rs = self.dataList[indexPath.row];
    cell.textLabel.text = [rs objectForKey:@"title"];
    
    //TODO 使用高性能的加载图片的方式，目前方式性能太差
    if([[rs objectForKey:@"images"] count] > 0){
        NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[rs objectForKey:@"images"][0]]];
        cell.imageView.image = [UIImage imageWithData:imgData];
    }
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    log(@"%ld", (long)indexPath.row);
}



-(void) startLoadData{

    NSString *url = @"/service/api/?act=index&channel=news&pagesize=25&version=2&format=json";
    [Utility requestByGet:url success:^(NSDictionary *data) {
        self.dataList = [data objectForKey:@"list"];
        
        
        [indicator stopAnimating];
        [self.tb reloadData];
    } error:^(NSError *error) {
        
    
    } option:nil];
    
    
}



@end
