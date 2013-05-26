//
//  STSectionViewController.m
//  UITableViewSamples
//
//  Created by EIMEI on 2013/05/26.
//  Copyright (c) 2013年 stack3.net. All rights reserved.
//

#import "STSectionViewController.h"
#import "STSection.h"

@implementation STSectionViewController {
    __weak IBOutlet UITableView *_tableView;
    __strong NSMutableArray *_sections;
}

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.title = @"Section";
        
        _sections = [NSMutableArray arrayWithCapacity:3];
        
        STSection *section;
        section = [[STSection alloc] init];
        section.title = @"Section1";
        [section.rows addObject:@"Item1"];
        [_sections addObject:section];
        
        section = [[STSection alloc] init];
        section.title = @"Section2";
        [section.rows addObject:@"Item1"];
        [section.rows addObject:@"Item2"];
        [_sections addObject:section];
        
        section = [[STSection alloc] init];
        section.title = @"Section3";
        [section.rows addObject:@"Item1"];
        [section.rows addObject:@"Item2"];
        [section.rows addObject:@"Item3"];
        [_sections addObject:section];
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
    STSection *sectionObject = [_sections objectAtIndex:section];
    return sectionObject.rows.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _sections.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    STSection *section = [_sections objectAtIndex:indexPath.section];
    NSString *title = [section.rows objectAtIndex:indexPath.row];
    
    cell.textLabel.text = title;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    STSection *sectionObject = [_sections objectAtIndex:section];
    return sectionObject.title;
}

#pragma mark - UITableViewDelegate

@end
