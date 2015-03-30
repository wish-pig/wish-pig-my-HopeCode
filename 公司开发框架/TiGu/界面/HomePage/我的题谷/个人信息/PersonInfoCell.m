//
//  PersonInfoCell.m
//  TiGu
//
//  Created by 咖啡可乐 on 14-1-10.
//  Copyright (c) 2014年 咖啡可乐. All rights reserved.
//

#import "PersonInfoCell.h"

@implementation PersonInfoCell

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
    [_titlabel release];
    [_detlabel release];
    [super dealloc];
}
@end
