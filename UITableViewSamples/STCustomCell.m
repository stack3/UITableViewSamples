//
//  STCustomCell.m
//  UITableViewSamples
//
//  Created by EIMEI on 2013/05/23.
//  Copyright (c) 2013年 stack3.net. All rights reserved.
//

#import "STCustomCell.h"

@implementation STCustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSString *nibName = NSStringFromClass([self class]);
        UINib *nib = [UINib nibWithNibName:nibName bundle:nil];
        UIView *view = [[nib instantiateWithOwner:self options:nil] objectAtIndex:0];
        view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        view.translatesAutoresizingMaskIntoConstraints = YES;
        
        self.frame = view.bounds;
        // At this time, contetView.frame is still (0, 0, 320, 44).
        // Must resize contentView.frame to self.bounds.
        [self setNeedsLayout];
        [self layoutIfNeeded];
        
        [self.contentView addSubview:view];
    }
    return self;
}

@end
