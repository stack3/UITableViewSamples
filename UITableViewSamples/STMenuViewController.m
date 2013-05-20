//
//  STViewController.m
//  UITableViewSamples
//
//  Created by EIMEI on 2013/05/13.
//  Copyright (c) 2013 stack3.net. All rights reserved.
//

#import "STMenuViewController.h"
#import "STMenuRow.h"
#import "STSimpleTableViewController.h"
#import "STMultipleCellsViewController.h"

@implementation STMenuViewController {
    __weak UITableView *_tableView;
    __strong NSMutableArray *_rows;
}

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.title = @"Nimbus Samples";
        
        _rows = [NSMutableArray arrayWithCapacity:10];
        
        STMenuRow *menuRow;
        //
        // SimpleTableView
        //
        menuRow = [[STMenuRow alloc] init];
        menuRow.title = @"Simple TableView";
        menuRow.viewControllerClass = [STSimpleTableViewController class];
        [_rows addObject:menuRow];
        //
        // MultipleCells
        //
        menuRow = [[STMenuRow alloc] init];
        menuRow.title = @"Multiple Cells";
        menuRow.viewControllerClass = [STMultipleCellsViewController class];
        [_rows addObject:menuRow];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect bounds = self.view.bounds;
    UITableView *tableView = [[UITableView alloc] initWithFrame:bounds style:UITableViewStylePlain];
    _tableView = tableView;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:tableView];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [_tableView deselectRowAtIndexPath:[_tableView indexPathForSelectedRow] animated:YES];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    STMenuRow *row = [_rows objectAtIndex:indexPath.row];
    
    cell.textLabel.text = row.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    STMenuRow *row = [_rows objectAtIndex:indexPath.row];

    UIViewController *con = [[row.viewControllerClass alloc] init];
    [self.navigationController pushViewController:con animated:YES];
}

@end
