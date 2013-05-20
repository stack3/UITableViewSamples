//
//  STMultipleCellRow.m
//  UITableViewSamples
//
//  Created by EIMEI on 2013/05/20.
//  Copyright (c) 2013年 stack3.net. All rights reserved.
//

#import "STMultipleCellRow.h"

@implementation STMultipleCellRow

- (NSString *)reuseIdentifier
{
    if (_cellStyle == UITableViewCellStyleDefault) {
        return @"Default";
    } else if (_cellStyle == UITableViewCellStyleSubtitle) {
        return @"Subtitle";
    } else if (_cellStyle == UITableViewCellStyleValue1) {
        return @"Value1";
    } else { // UITableViewCellStyleValue2
        return @"Value2";
    }
}

@end
