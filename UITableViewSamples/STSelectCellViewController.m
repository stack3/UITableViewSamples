//
//  STSelectCellViewController.m
//  UITableViewSamples
//
//  Created by EIMEI on 2013/05/21.
//  Copyright (c) 2013年 stack3.net. All rights reserved.
//

#import "STSelectCellViewController.h"
#import "STSelectCellDetailViewController.h"

@implementation STSelectCellViewController {
    IBOutlet __weak UITableView *_tableView;
    __strong NSMutableArray *_rows;
}

- (id)init
{
    self = [super initWithNibName:@"STSelectCellViewController" bundle:nil];
    if (self) {
        self.title = @"Select Cell";
        
        _rows = [NSMutableArray arrayWithCapacity:100];
        for (int i = 0; i < 100; i++) {
            NSString *title = [NSString stringWithFormat:@"Item %d", i];
            [_rows addObject:title];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _tableView.dataSource = self;
    _tableView.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [_tableView deselectRowAtIndexPath:_tableView.indexPathForSelectedRow animated:YES];
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
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    NSString *title = [_rows objectAtIndex:indexPath.row];
    cell.textLabel.text = title;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *title = [_rows objectAtIndex:indexPath.row];
    
    STSelectCellDetailViewController *controller = [[STSelectCellDetailViewController alloc] initWithLabelTitle:title];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
