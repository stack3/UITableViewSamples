//
//  STMenuRow.h
//  UITableViewSamples
//
//  Created by EIMEI on 2013/05/13.
//  Copyright (c) 2013 stack3.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STMenuRow : NSObject

@property (strong, nonatomic) NSString *title;
@property (weak, nonatomic) Class viewControllerClass;

@end
