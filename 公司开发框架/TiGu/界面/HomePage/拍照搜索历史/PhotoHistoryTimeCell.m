//
//  PhotoHistoryTimeCell.m
//  TiGu
//
//  Created by 咖啡可乐 on 13-12-25.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import "PhotoHistoryTimeCell.h"

@implementation PhotoHistoryTimeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_labeltime release];
    [super dealloc];
}
@end
