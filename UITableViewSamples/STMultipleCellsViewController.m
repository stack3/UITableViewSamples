//
//  STMultipleCellsViewController.m
//  UITableViewSamples
//
//  Created by EIMEI on 2013/05/20.
//  Copyright (c) 2013年 stack3.net. All rights reserved.
//

#import "STMultipleCellsViewController.h"
#import "STMultipleCellRow.h"

@interface STMultipleCellsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *rows;

@end

@implementation STMultipleCellsViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.title = @"Multiple Cells";
    
    _rows = [NSMutableArray arrayWithCapacity:30];
    for (int i = 0; i < 10; i++) {
        STMultipleCellRow *row = [[STMultipleCellRow alloc] init];
        row.cellStyle = UITableViewCellStyleDefault;
        row.title = [NSString stringWithFormat:@"Title %d", i];
        row.image = [UIImage imageNamed:@"castle01.jpg"];
        [_rows addObject:row];
        
        row = [[STMultipleCellRow alloc] init];
        row.cellStyle = UITableViewCellStyleSubtitle;
        row.title = [NSString stringWithFormat:@"Title %d", i];
        row.detail = @"Detail";
        row.image = [UIImage imageNamed:@"castle02.jpg"];
        [_rows addObject:row];
        
        row = [[STMultipleCellRow alloc] init];
        row.cellStyle = UITableViewCellStyleValue1;
        row.title = [NSString stringWithFormat:@"Left %d", i];
        row.detail = [NSString stringWithFormat:@"Right %d", i];
        row.image = [UIImage imageNamed:@"castle03.jpg"];
        [_rows addObject:row];
        
        row = [[STMultipleCellRow alloc] init];
        row.cellStyle = UITableViewCellStyleValue2;
        row.title = [NSString stringWithFormat:@"Left %d", i];
        row.detail = [NSString stringWithFormat:@"Right %d", i];
        [_rows addObject:row];
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
    STMultipleCellRow *row = [_rows objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:row.reuseIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:row.cellStyle reuseIdentifier:row.reuseIdentifier];
    }
    
    cell.textLabel.text = row.title;
    cell.detailTextLabel.text = row.detail;
    cell.imageView.image = row.image;
    
    return cell;
}

@end
