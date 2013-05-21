//
//  STSelectCellDetailViewController.m
//  UITableViewSamples
//
//  Created by EIMEI on 2013/05/21.
//  Copyright (c) 2013年 stack3.net. All rights reserved.
//

#import "STSelectCellDetailViewController.h"

@implementation STSelectCellDetailViewController {
    __strong NSString *_labelTitle;
    IBOutlet __weak UILabel *_label;
}

- (id)initWithLabelTitle:(NSString *)labelTitle
{
    self = [super initWithNibName:@"STSelectCellDetailViewController" bundle:nil];
    if (self) {
        self.title = @"Select Cell Detail";
        _labelTitle = labelTitle;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _label.textAlignment = NSTextAlignmentCenter;
    _label.text = _labelTitle;
}

@end
