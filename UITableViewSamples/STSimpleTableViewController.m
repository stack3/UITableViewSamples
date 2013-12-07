//
//  STSimpleTableViewController.m
//  UITableViewSamples
//
//  Created by EIMEI on 2013/05/19.
//  Copyright (c) 2013年 stack3.net. All rights reserved.
//

#import "STSimpleTableViewController.h"

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
    
    _tableView.dataSource = self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"CellID";
    
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    NSString *title = [_rows objectAtIndex:indexPath.row];
    cell.textLabel.text = title;
    
    return cell;
}

@end
