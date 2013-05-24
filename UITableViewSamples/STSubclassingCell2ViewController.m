//
//  STSubclassingCell2ViewController.m
//  UITableViewSamples
//
//  Created by EIMEI on 2013/05/24.
//  Copyright (c) 2013年 stack3.net. All rights reserved.
//

#import "STSubclassingCell2ViewController.h"
#import "STCustomRow.h"
#import "STCustomCell2.h"

@implementation STSubclassingCell2ViewController {
    IBOutlet __weak UITableView *_tableView;
    __strong NSMutableArray *_rows;
}

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.title = @"Subclassing Cell";
        
        _rows = [NSMutableArray arrayWithCapacity:3];
        
        STCustomRow *row = [[STCustomRow alloc] init];
        row.title = @"castle01";
        row.image = [UIImage imageNamed:@"castle01.jpg"];
        [_rows addObject:row];
        
        row = [[STCustomRow alloc] init];
        row.title = @"castle02";
        row.image = [UIImage imageNamed:@"castle02.jpg"];
        [_rows addObject:row];
        
        row = [[STCustomRow alloc] init];
        row.title = @"castle03";
        row.image = [UIImage imageNamed:@"castle03.jpg"];
        [_rows addObject:row];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tableView.dataSource = self;
    _tableView.rowHeight = 350;
    
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
    
    STCustomCell2 *cell = (STCustomCell2 *)[_tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[STCustomCell2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    STCustomRow *row = [_rows objectAtIndex:indexPath.row];
    cell.titleLabel.text = row.title;
    cell.photoImageView.image = row.image;
    
    return cell;
}

@end
