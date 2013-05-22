//
//  STEditingViewController.m
//  UITableViewSamples
//
//  Created by EIMEI on 2013/05/22.
//  Copyright (c) 2013年 stack3.net. All rights reserved.
//

#import "STEditingViewController.h"

@implementation STEditingViewController {
    IBOutlet __weak UITableView *_tableView;
    __strong NSMutableArray *_rows;
}

- (id)init
{
    self = [super initWithNibName:@"STEditingViewController" bundle:nil];
    if (self) {
        self.title = @"Editing";
        
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
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit"
                                                                              style:UIBarButtonItemStyleBordered
                                                                             target:self
                                                                             action:@selector(didTapEditButton)];
}

- (void)didTapEditButton
{
    [_tableView setEditing:!_tableView.editing animated:YES];
    if (_tableView.editing) {
        self.navigationItem.rightBarButtonItem.title = @"Cancel";
    } else {
        self.navigationItem.rightBarButtonItem.title = @"Edit";
    }
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

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_rows removeObjectAtIndex:indexPath.row];
    [_tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
