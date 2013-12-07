//
//  STSimpleTableViewController.m
//  UITableViewSamples
//
//  Created by EIMEI on 2013/05/19.
//  Copyright (c) 2013年 stack3.net. All rights reserved.
//

#import "STSimpleTableViewController.h"

#define _STCellId @"Cell"

@interface STSimpleTableViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *rows;

@end

@implementation STSimpleTableViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.title = @"Simple TableView";
    
    _rows = [NSMutableArray arrayWithCapacity:100];
    for (int i = 0; i < 100; i++) {
        NSString *title = [NSString stringWithFormat:@"Item %d", i];
        [_rows addObject:title];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:_STCellId];
    _tableView.dataSource = self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *title = [_rows objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:_STCellId forIndexPath:indexPath];
    cell.textLabel.text = title;
    
    return cell;
}

@end
