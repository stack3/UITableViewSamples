//
//  STSelectCellDetailViewController.m
//  UITableViewSamples
//
//  Created by EIMEI on 2013/05/21.
//  Copyright (c) 2013年 stack3.net. All rights reserved.
//

#import "STSelectCellDetailViewController.h"

@interface STSelectCellDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation STSelectCellDetailViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.title = @"Select Cell Detail";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _label.textAlignment = NSTextAlignmentCenter;
    _label.text = _labelTitle;
}

@end
