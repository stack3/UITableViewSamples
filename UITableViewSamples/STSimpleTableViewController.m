//
//  STSimpleTableViewController.m
//  UITableViewSamples
//
//  Created by EIMEI on 2013/05/19.
//  Copyright (c) 2013年 stack3.net. All rights reserved.
//

#import "STSimpleTableViewController.h"

@implementation STSimpleTableViewController {
    IBOutlet __weak UITableView *_tableView;
    
    __strong NSMutableArray *_rows;
}

- (id)init
{
    self = [super initWithNibName:@"STSimpleTableViewController" bundle:nil];
    if (self) {
        self.title = @"Simple TableView";
        
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
        
        static int i = 0;
        i++;
        NSLog(@"created %d", i);
    }
    
    NSString *title = [_rows objectAtIndex:indexPath.row];
    cell.textLabel.text = title;
    
    return cell;
}

@end
