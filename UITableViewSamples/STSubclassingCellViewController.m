//
//  STSubclassingCellViewController.m
//  UITableViewSamples
//
//  Created by EIMEI on 2013/05/22.
//  Copyright (c) 2013年 stack3.net. All rights reserved.
//

#import "STSubclassingCellViewController.h"
#import "STCustomRow.h"
#import "STCustomCell.h"

#define _STCellId @"Cell"
#define _STCellForHeightId @"CellForHeight"

@interface STSubclassingCellViewController ()

@property (strong, nonatomic) NSMutableArray *rows;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) STCustomCell *cellForHeight;

@end

@implementation STSubclassingCellViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    
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
    row.title = @"castle03\nLorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua";
    row.image = [UIImage imageNamed:@"castle03.jpg"];
    [_rows addObject:row];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    // _tableView.rowHeight = 350;
    
    [_tableView registerClass:[STCustomCell class] forCellReuseIdentifier:_STCellId];
    [_tableView registerClass:[STCustomCell class] forCellReuseIdentifier:_STCellForHeightId];
    
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
    STCustomCell *cell = [_tableView dequeueReusableCellWithIdentifier:_STCellId forIndexPath:indexPath];
    
    STCustomRow *row = [_rows objectAtIndex:indexPath.row];
    cell.titleLabel.text = row.title;
    cell.photoImageView.image = row.image;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    STCustomCell *cell = [_tableView dequeueReusableCellWithIdentifier:_STCellForHeightId];
    
    STCustomRow *row = [_rows objectAtIndex:indexPath.row];
    cell.titleLabel.text = row.title;
    cell.photoImageView.image = row.image;
    
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    return height;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_rows removeObjectAtIndex:indexPath.row];
        [_tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

@end
