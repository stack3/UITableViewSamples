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
#import "STSelectCellViewController.h"
#import "STEditingViewController.h"
#import "STSubclassingCellViewController.h"
#import "STSectionViewController.h"

@interface STMenuViewController ()

@property (strong, nonatomic) NSMutableArray *rows;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation STMenuViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.title = @"UITableView Samples";
    
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
    //
    // SelectCell
    //
    menuRow = [[STMenuRow alloc] init];
    menuRow.title = @"Select Cell";
    menuRow.viewControllerClass = [STSelectCellViewController class];
    [_rows addObject:menuRow];
    //
    // Editing
    //
    menuRow = [[STMenuRow alloc] init];
    menuRow.title = @"Editing";
    menuRow.viewControllerClass = [STEditingViewController class];
    [_rows addObject:menuRow];
    //
    // SubclassingCell
    //
    menuRow = [[STMenuRow alloc] init];
    menuRow.title = @"Subclassing Cell";
    menuRow.viewControllerClass = [STSubclassingCellViewController class];
    [_rows addObject:menuRow];
    //
    // Section
    //
    menuRow = [[STMenuRow alloc] init];
    menuRow.title = @"Section";
    menuRow.viewControllerClass = [STSectionViewController class];
    [_rows addObject:menuRow];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _tableView.dataSource = self;
    _tableView.delegate = self;
    
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

    NSString *storyboardName = NSStringFromClass(row.viewControllerClass);
    UIStoryboard *sb = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UIViewController *con = [sb instantiateInitialViewController];
    [self.navigationController pushViewController:con animated:YES];
}

@end
