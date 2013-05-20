//
//  STMultipleCellRow.h
//  UITableViewSamples
//
//  Created by EIMEI on 2013/05/20.
//  Copyright (c) 2013年 stack3.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STMultipleCellRow : NSObject

@property (nonatomic) UITableViewCellStyle cellStyle;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *detail;
@property (strong, nonatomic) UIImage *image;

- (NSString *)reuseIdentifier;

@end
