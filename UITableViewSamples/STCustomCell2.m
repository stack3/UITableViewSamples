//
//  STCustomCell2.m
//  UITableViewSamples
//
//  Created by EIMEI on 2013/05/24.
//  Copyright (c) 2013年 stack3.net. All rights reserved.
//

#import "STCustomCell2.h"

@implementation STCustomCell2

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"STViewOnContentViewOfCustomCell2"
                                                       owner:nil
                                                     options:nil];
        UIView *viewOnContentView = [views objectAtIndex:0];
        [self.contentView addSubview:viewOnContentView];
    }
    return self;
}

@end
