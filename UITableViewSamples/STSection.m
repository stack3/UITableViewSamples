//
//  STSection.m
//  UITableViewSamples
//
//  Created by EIMEI on 2013/05/26.
//  Copyright (c) 2013年 stack3.net. All rights reserved.
//

#import "STSection.h"

@implementation STSection

- (id)init
{
    self = [super init];
    if (self) {
        _rows = [NSMutableArray arrayWithCapacity:10];
    }
    return self;
}

@end
