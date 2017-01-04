//
//  ViewController.m
//  ZHNThresholdHelper
//
//  Created by zhn on 16/11/9.
//  Copyright © 2016年 zhn. All rights reserved.
//

#import "ViewController.h"
#import "delegateContainer.h"
#import "ZHNThresholdHelper.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak) UITableView * contentTableView;
@property (nonatomic,strong) NSMutableArray * statusArray;

@property (nonatomic,strong) ZHNThresholdHelper * helper;
@property (nonatomic,strong) delegateContainer * container;

@end

@implementation ViewController

//
//
// 这种方式比较适合定高的cell(不定高或者高度差距很大的情况下会不太准)
//
//

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView * contentTableView = [[UITableView alloc]init];
    self.contentTableView = contentTableView;
    [self.view addSubview:contentTableView];
    self.contentTableView.frame = self.view.bounds;
    
    //----- addcount填的值需要和reloadaction里增加的值相对应
    __weak __typeof__(self) weakSelf = self;
    ZHNThresholdHelper * helper = [[ZHNThresholdHelper alloc]initWithThreshold:0.7 everyLoadAddCount:30 contol:self tableView:contentTableView reloadAction:^{
        for (int index = 0; index < 30; index++) {
            [_statusArray addObject:@""];
        }
        [weakSelf.contentTableView reloadData];
        [weakSelf.helper endLoadDatas];
    }];
    self.helper = helper;

    self.contentTableView.dataSource = self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.statusArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [[UITableViewCell alloc]init];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}


#pragma mark - setters and getters
- (NSMutableArray *)statusArray{
    if (_statusArray == nil) {
        _statusArray = [NSMutableArray array];
        for (int index = 0; index < 30; index++) {
            [_statusArray addObject:@""];
        }
    }
    return _statusArray;
}

@end
