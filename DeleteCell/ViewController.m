//
//  ViewController.m
//  DeleteCell
//
//  Created by fengbai on 16/7/7.
//  Copyright © 2016年 fengbai. All rights reserved.
//

#import "ViewController.h"
#import "DelegateTableViewCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

static NSString *cellID = @"DelegateTableViewCell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tableView.tableFooterView = [UIView new];
    [_tableView registerNib:[UINib nibWithNibName:cellID bundle:nil] forCellReuseIdentifier:cellID];
    _dataArray = [@[@"0000000000", @"111111111111",@"2222222222",@"3333333333",@"4444444444",@"5555555555",@"6666666666",@"7777777777",@"8888888888",@"9999999999"] mutableCopy];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DelegateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.titleStr = self.dataArray[indexPath.row];
    cell.deleteBlock = ^{
        if (self.dataArray.count) {
            NSLog(@"%ld", indexPath.row);
            [self.dataArray removeObjectAtIndex:indexPath.row];
            [tableView reloadData];
        }
    };
    cell.swipeBlock = ^{
        for (DelegateTableViewCell *leftCell in tableView.visibleCells) {
            if (leftCell != cell) {
                [leftCell closeView];
            }
        }
    };
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"---%ld",indexPath.row);
}


@end
