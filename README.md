{\rtf1\ansi\ansicpg936\cocoartf1265\cocoasubrtf210
{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;\f1\fnil\fcharset134 STHeitiSC-Light;}
{\colortbl;\red255\green255\blue255;\red164\green8\blue0;}
\paperw11900\paperh16840\margl1440\margr1440\vieww20980\viewh8920\viewkind0
\deftab529
\pard\tx529\pardeftab529\pardirnatural

\f0\fs22 \cf0 \CocoaLigature0                 BOOL showConfirmedBtn = YES;\
        \
        if ([CommonUtil isEmpty:name]) \{\
            name = _defaultName;\
        \}\
        if ([CommonUtil isEmpty:phone]) \{\
            phone = _defaultPhone;\
        \}\
        if ([CommonUtil isEmpty:hallTimes]) \{\
            hallTimes = _defaultHallTimes;\
        \}\
        if ([CommonUtil isEmpty:hallName]) \{\
            hallName = _defaultHallName;\
        \}\
        if ([CommonUtil isEmpty:tableNum]) \{\
            tableNum = _defaultTabel;\
        \}\
        if ([CommonUtil isEmpty:updateTime]) \{\
            updateTime = _defaultUpdateTime;\
        \}else\{\
            NSDate *date = [CommonUtil getDateForString:updateTime format:@"yyyy-MM-dd HH:mm:ss"];\
            updateTime = [CommonUtil getStringForDate:date format:@"yyyy-MM-dd HH:mm"];\
            //
\f1 \'b8\'f1\'ca\'bd\'b2\'bb\'d5\'fd\'c8\'b7
\f0 \
            if ([CommonUtil isEmpty:updateTime])\{\
                updateTime = _defaultUpdateTime;\
            \}\
        \}\
        if ([CommonUtil isEmpty:weddingDate]) \{\
            weddingDate = _defaultWeddingDate;\
        \}else\{\
            //
\f1 \'b8\'f1\'ca\'bd\'bb\'af\'c8\'d5\'c6\'da
\f0 \
            NSDate *date = [CommonUtil getDateForString:weddingDate format:@"yyyy-MM-dd"];\
            weddingDate = [CommonUtil getStringForDate:date format:@"yyyy
\f1 \'c4\'ea
\f0 MM
\f1 \'d4\'c2
\f0 dd
\f1 \'c8\'d5
\f0 "];\
            //
\f1 \'b8\'f1\'ca\'bd\'b2\'bb\'d5\'fd\'c8\'b7
\f0 \
            if ([CommonUtil isEmpty:weddingDate])\{\
                weddingDate = _defaultWeddingDate;\
            \}\
        \}\
        if ([CommonUtil isEmpty:date]) \{\
            //
\f1 \'c8\'d5\'c6\'da\'d4\'dd\'ce\'de
\f0 \
            arriveDate = _defaultArriveDate;\
        \}\
//        else if (![CommonUtil isEmpty:date] && [CommonUtil isEmpty:time])\{\
//            //
\f1 \'c8\'d5\'c6\'da\'d3\'d0\'a3\'ac\'ca\'b1\'bc\'e4\'ce\'de
\f0 \
//            arriveDate = [NSString stringWithFormat:@"%@ %@", date, _defaultArriveTime];\
//            appointDate = [CommonUtil getDateForString:date format:@"yyyy-MM-dd"];\
//        \}else if ([CommonUtil isEmpty:date] && ![CommonUtil isEmpty:time])\{\
//            //
\f1 \'c8\'d5\'c6\'da\'ce\'de\'a3\'ac\'ca\'b1\'bc\'e4\'d3\'d2
\f0 \
//            arriveDate = [NSString stringWithFormat:@"%@ %@", _defaultArriveDate, time];\
//        \}\
        else\{\
            //
\f1 \'c8\'d5\'c6\'da\'c8\'ab
\f0 \
            arriveDate = [NSString stringWithFormat:@"%@", date];\
            appointDate = [CommonUtil getDateForString:arriveDate format:@"yyyy-MM-dd HH:mm"];\
            \
        \}\
        \
        _nameLabel.text = name;\
        _arriveDateLabel.text = [NSString stringWithFormat:@"
\f1 \'b5\'bd\'b5\'ea\'c8\'d5\'c6\'da\'a3\'ba
\f0 %@", arriveDate];\
        _hallNameLabel.text = [NSString stringWithFormat:@"
\f1 \'d1\'e7\'bb\'e1\'cc\'fc\'a3\'ba
\f0 %@", hallName];\
        _hallTimesLabel.text = [NSString stringWithFormat:@"
\f1 \'b3\'a1\'b4\'ce\'a3\'ba
\f0  %@", hallTimes];\
        _tabelLabel.text = [NSString stringWithFormat:@"
\f1 \'d7\'c0\'ca\'fd\'a3\'ba
\f0 %@", tableNum];\
        _phoneLabel.text = [NSString stringWithFormat:@"
\f1 \'c1\'aa\'cf\'b5\'b5\'e7\'bb\'b0\'a3\'ba
\f0 %@", phone];\
        _updateTimeLabel.text = [NSString stringWithFormat:@"
\f1 \'d4\'a4\'d4\'bc\'cc\'e1\'bd\'bb\'a3\'ba
\f0 %@", updateTime];\
        \
        NSMutableAttributedString *weddingDateStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"
\f1 \'bb\'e9\'c6\'da\'a3\'ba
\f0 %@", weddingDate]];\
        [weddingDateStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:11] range:NSMakeRange(0, 3)];\
        _weddingDateLabel.attributedText = weddingDateStr;\
        \
        NSMutableAttributedString *phoneStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"
\f1 \'c1\'aa\'cf\'b5\'b5\'e7\'bb\'b0\'a3\'ba
\f0 %@", phone]];\
        [phoneStr addAttribute:NSForegroundColorAttributeName value:RGB(102, 102, 102) range:NSMakeRange(0, 5)];\
        _phoneLabel.attributedText = phoneStr;\
\
        if ([status intValue] == statusBeConfirmed) \{\
            //
\f1 \'b4\'fd\'c8\'b7\'c8\'cf
\f0 ,
\f1 \'cf\'d4\'ca\'be\'b0\'b4\'c5\'a5
\f0 \
            _confirmedBtn.hidden = NO;\
            _refuseBtn.hidden = NO;\
            \
            //
\f1 \'cc\'ed\'bc\'d3\'d0\'c2\'d4\'bc\'ca\'f8
\f0 \
            [self.mainScrollView addConstraint:[NSLayoutConstraint\
                                                constraintWithItem:self.refuseBtn\
                                                attribute:NSLayoutAttributeTop\
                                                relatedBy:NSLayoutRelationLessThanOrEqual\
                                                toItem:self.confirmedBtn\
                                                attribute:NSLayoutAttributeBottom\
                                                multiplier:1.0\
                                                constant:18]];\
        \} else if ([status intValue] == statusConfirmed)\{\
            //
\f1 \'c9\'cc\'bc\'d2\'c8\'b7\'c8\'cf
\f0 \
            if ([CommonUtil isEmpty:date]) \{\
                //
\f1 \'c8\'d5\'c6\'da\'d4\'dd\'ce\'de\'a3\'ac\'cf\'d4\'ca\'be\'cf\'d4\'ca\'be\'c8\'a1\'cf\'fb\'ba\'cd\'b8\'c4\'c6\'da
\f0 \
                [self.confirmedBtn setTitle:@"
\f1 \'c8\'b7\'c8\'cf
\f0 " forState:UIControlStateNormal];\
                [self.refuseBtn setTitle:@"
\f1 \'c8\'a1\'cf\'fb
\f0 " forState:UIControlStateNormal];\
                showConfirmedBtn = NO;\
                \
            \}else if (![CommonUtil isEmpty:date])\{\
                //
\f1 \'c5\'d0\'b6\'cf\'ca\'c7\'b7\'f1\'d2\'d1\'be\'ad\'b9\'fd\'c1\'cb\'b5\'bd\'b5\'ea\'c8\'d5\'c6\'da
\f0 \
                NSDate *nowDate = [NSDate date];\
                if (self.from == 1)\{\
                    if ([nowDate compare:[CommonUtil getDateForString:date format:@"yyyy-MM-dd"]] == NSOrderedDescending) \{\
                        //nowDate 
\f1 \'b4\'f3\'d3\'da\'b5\'bd\'b5\'ea\'ca\'b1\'bc\'e4
\f0 ,
\f1 \'cf\'d4\'ca\'be\'d2\'d1\'b5\'bd\'b5\'ea\'ba\'cd\'ce\'b4\'b0\'b4\'ca\'b1\'b8\'b0\'d4\'bc
\f0 \
                        [self.confirmedBtn setTitle:@"
\f1 \'d2\'d1\'b5\'bd\'b5\'ea
\f0 " forState:UIControlStateNormal];\
                        [self.refuseBtn setTitle:@"
\f1 \'ce\'b4\'b0\'b4\'ca\'b1\'b8\'b0\'d4\'bc
\f0 " forState:UIControlStateNormal];\
                        showConfirmedBtn = YES;\
                    \}else\{\
                        //nowDate 
\f1 \'d0\'a1\'d3\'da\'b5\'bd\'b5\'ea\'ca\'b1\'bc\'e4
\f0 ,
\f1 \'cf\'d4\'ca\'be\'c8\'a1\'cf\'fb\'ba\'cd\'b8\'c4\'c6\'da
\f0 \
                        [self.confirmedBtn setTitle:@"
\f1 \'c8\'b7\'c8\'cf
\f0 " forState:UIControlStateNormal];\
                        [self.refuseBtn setTitle:@"
\f1 \'c8\'a1\'cf\'fb
\f0 " forState:UIControlStateNormal];\
                        showConfirmedBtn = NO;\
                    \}\
                \}\
            \}else if ([CommonUtil isEmpty:date])\{\
                //
\f1 \'c8\'d5\'c6\'da\'ce\'de\'a3\'ac\'ca\'b1\'bc\'e4\'d3\'d0\'a3\'ac\'cf\'d4\'ca\'be\'cf\'d4\'ca\'be\'c8\'a1\'cf\'fb\'ba\'cd\'b8\'c4\'c6\'da
\f0 \
                [self.confirmedBtn setTitle:@"
\f1 \'c8\'b7\'c8\'cf
\f0 " forState:UIControlStateNormal];\
                [self.refuseBtn setTitle:@"
\f1 \'c8\'a1\'cf\'fb
\f0 " forState:UIControlStateNormal];\
                showConfirmedBtn = NO;\
            \}else\{\
                //
\f1 \'c8\'d5\'c6\'da\'c8\'ab
\f0 \
                NSDate *nowDate = [NSDate date];\
                if (self.from == 1)\{\
                    if ([nowDate compare:appointDate] == NSOrderedDescending) \{\
                        //nowDate 
\f1 \'b4\'f3\'d3\'da\'b5\'bd\'b5\'ea\'ca\'b1\'bc\'e4
\f0 ,
\f1 \'cf\'d4\'ca\'be\'d2\'d1\'b5\'bd\'b5\'ea\'ba\'cd\'ce\'b4\'b0\'b4\'ca\'b1\'b8\'b0\'d4\'bc
\f0 \
                        [self.confirmedBtn setTitle:@"
\f1 \'d2\'d1\'b5\'bd\'b5\'ea
\f0 " forState:UIControlStateNormal];\
                        [self.refuseBtn setTitle:@"
\f1 \'ce\'b4\'b0\'b4\'ca\'b1\'b8\'b0\'d4\'bc
\f0 " forState:UIControlStateNormal];\
                        showConfirmedBtn = YES;\
                    \}else\{\
                        //nowDate 
\f1 \'d0\'a1\'d3\'da\'b5\'bd\'b5\'ea\'ca\'b1\'bc\'e4
\f0 ,
\f1 \'cf\'d4\'ca\'be\'c8\'a1\'cf\'fb\'ba\'cd\'b8\'c4\'c6\'da
\f0 \
                        [self.confirmedBtn setTitle:@"
\f1 \'c8\'b7\'c8\'cf
\f0 " forState:UIControlStateNormal];\
                        [self.refuseBtn setTitle:@"
\f1 \'c8\'a1\'cf\'fb
\f0 " forState:UIControlStateNormal];\
                        showConfirmedBtn = NO;\
                    \}\
                \}\
            \}\
\
            if (showConfirmedBtn) \{\
                //
\f1 \'c8\'a1\'cf\'fb\'a1\'a2\'c8\'b7\'c8\'cf
\f0 \
                _confirmedBtn.hidden = NO;\
                _refuseBtn.hidden = NO;\
                \
                //
\f1 \'cc\'ed\'bc\'d3\'d0\'c2\'d4\'bc\'ca\'f8
\f0 \
                [self.mainScrollView addConstraint:[NSLayoutConstraint\
                                                    constraintWithItem:self.refuseBtn\
                                                    attribute:NSLayoutAttributeTop\
                                                    relatedBy:NSLayoutRelationLessThanOrEqual\
                                                    toItem:self.confirmedBtn\
                                                    attribute:NSLayoutAttributeBottom\
                                                    multiplier:1.0\
                                                    constant:18]];\
            \}else\{\
                //
\f1 \'c8\'a1\'cf\'fb\'ba\'cd\'b8\'c4\'c6\'da
\f0 \
                _refuseBtn.hidden = NO;\
                if ([canChange intValue] == 1) \{\
                    //
\f1 \'bf\'c9\'d2\'d4\'b8\'c4\'c6\'da
\f0 \
                    _changeBtn.hidden = NO;\
                \}\
                CGRect confirmFrame = self.confirmedBtn.frame;\
                CGRect refuseFrame = self.refuseBtn.frame;\
                \
                self.refuseBtn.frame = confirmFrame;\
                self.changeBtn.frame = refuseFrame;\
                //
\f1 \'cc\'ed\'bc\'d3\'d0\'c2\'d4\'bc\'ca\'f8
\f0 \
                //
\f1 \'cc\'ed\'bc\'d3\'b6\'d4\'c6\'eb\'d4\'bc\'ca\'f8
\f0 \
                [self.mainScrollView addConstraint:[NSLayoutConstraint\
                                                    constraintWithItem:self.changeBtn\
                                                    attribute:NSLayoutAttributeTop\
                                                    relatedBy:NSLayoutRelationLessThanOrEqual\
                                                    toItem:self.refuseBtn\
                                                    attribute:NSLayoutAttributeBottom\
                                                    multiplier:1.0\
                                                    constant:18]];\
                //
\f1 \'cc\'ed\'bc\'d3\'b6\'a5\'b2\'bf\'d4\'bc\'ca\'f8
\f0 \
                [self.mainScrollView addConstraint:[NSLayoutConstraint\
                                                    constraintWithItem:self.refuseBtn\
                                                    attribute:NSLayoutAttributeTop\
                                                    relatedBy:NSLayoutRelationEqual\
                                                    toItem:self.changeBtn.superview\
                                                    attribute:NSLayoutAttributeTop\
                                                    multiplier:1.0\
                                                    constant:254]];\
                \
            \}\
            \
        \}\
\

\fs96 \cf2 AppointmentManageViewController\

\fs22 \cf0 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath\{\
    \
    NSString *CellIndentifier = [NSString stringWithFormat:@"AppointmentCell%ld%ld", (long)[indexPath section],(long)indexPath.row];\
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIndentifier];\
    //
\f1 \'c8\'e7\'b9\'fb
\f0 cell
\f1 \'ce\'aa
\f0 nil
\f1 \'be\'cd\'d0\'c2\'bd\'a8\'d2\'bb\'b8\'f6
\f0 \
    if (cell == nil) \{\
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIndentifier];\
    \}\
    if (indexPath.row >= _orderArray.count) \{\
        return cell;\
    \}\
    \
    NSDictionary *dic = [_orderArray objectAtIndex:indexPath.row];\
    NSString *total = dic[@"total"];\
    NSString *time = dic[@"time"];\
    NSMutableArray *itemArray = dic[@"data"];\
    CGFloat totalHeight = 0;//
\f1 \'bc\'c6\'cb\'e3
\f0 cell
\f1 \'b5\'c4\'b8\'df\'b6\'c8
\f0 \
    \
    /************************ 
\f1 \'c8\'d5\'c6\'da\'c0\'b8\'bf\'aa\'ca\'bc
\f0  **************/\
    //
\f1 \'c5\'d0\'b6\'cf\'b8\'c3\'c8\'d5\'c6\'da\'d3\'eb\'c9\'cf\'d2\'bb\'b8\'f6\'c8\'d5\'c6\'da\'ca\'c7\'b7\'f1\'d2\'bb\'d6\'c2
\f0 \
    BOOL showDateView = YES;\
    if (indexPath.row > 0) \{\
        NSDictionary *beforeDic = [_orderArray objectAtIndex:indexPath.row-1];\
        NSString *beforeTime = beforeDic[@"time"];\
        if ([beforeTime isEqualToString:time]) \{\
            //
\f1 \'c8\'d5\'c6\'da\'d2\'bb\'d6\'c2\'a3\'ac\'b2\'bb\'d4\'da\'cf\'d4\'ca\'be\'c8\'d5\'c6\'da\'c0\'b8
\f0 \
//            dateView.frame = CGRectMake(0, 0, 0, 0);\
            showDateView = NO;\
        \}\
    \}\
    \
    //
\f1 \'cf\'d4\'ca\'be\'c8\'d5\'c6\'da\'c0\'b8
\f0 \
    UIView *dateView = [[UIView alloc] init];\
    dateView.backgroundColor = RGB(247, 247, 247);\
    [cell.contentView addSubview:dateView];\
    \
    if (showDateView) \{\
        dateView.frame = CGRectMake(0, 0, CGRectGetWidth(_mainTableView.frame), 42);\
        NSDate *timeDate = [CommonUtil getDateForString:time format:@"yyyy-MM-dd"];\
        NSString *timeFormat = [CommonUtil getStringForDate:timeDate format:@"dd
\f1 \'c8\'d5
\f0 "];\
        timeFormat = [NSString stringWithFormat:@"%@ %@", timeFormat, [CommonUtil getEnglishWeekday:timeDate]];\
        NSString *dateStr = [NSString stringWithFormat:@"%@ %@
\f1 \'b6\'d4
\f0 ", timeFormat, total];\
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:dateStr];\
        [str addAttribute:NSForegroundColorAttributeName value:RGB(224, 32, 32) range:NSMakeRange(0, dateStr.length)];\
        [str addAttribute:NSForegroundColorAttributeName value:RGB(51, 51, 51) range:NSMakeRange(0, dateStr.length - 2)];\
        \
        UILabel *itemDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, CGRectGetWidth(dateView.frame) - 20, 42)];\
        itemDateLabel.attributedText = str;\
        itemDateLabel.font = [UIFont systemFontOfSize:16];\
        itemDateLabel.textAlignment = NSTextAlignmentLeft;\
        [dateView addSubview:itemDateLabel];\
        \
        //
\f1 \'cf\'c2\'bb\'ae\'cf\'df
\f0 \
        UIView *underlineView1 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(dateView.frame) - 1, CGRectGetWidth(dateView.frame), 1)];\
        underlineView1.backgroundColor = RGB(209, 209, 209);\
        [dateView addSubview:underlineView1];\
    \}\
    \
    /************************ 
\f1 \'c8\'d5\'c6\'da\'c0\'b8\'bd\'e1\'ca\'f8
\f0  **********************************/\
    if (showDateView)\{\
        totalHeight += CGRectGetHeight(dateView.frame);\
    \}\
    \
    //
\f1 \'bb\'ad\'b3\'f6\'ca\'b1\'bc\'e4\'cc\'f5\'c4\'bf
\f0 \
    CGFloat y = 0;\
    if (showDateView)\{\
        //
\f1 \'cf\'d4\'ca\'be\'c8\'d5\'c6\'da\'c0\'b8
\f0 \
        y = CGRectGetHeight(dateView.frame);\
    \}\
    for (int i = 0; i < itemArray.count; i++) \{\
        NSDictionary *itemDic = [itemArray objectAtIndex:i];\
        NSString *itemTime = itemDic[@"time"];\
        NSMutableArray *itemDetailArray = itemDic[@"data"];\
        \
        /******************   
\f1 \'cf\'d4\'ca\'be\'ca\'b1\'bc\'e4\'c0\'b8\'bf\'aa\'ca\'bc
\f0   *******************/\
        //
\f1 \'cf\'d4\'ca\'be\'ca\'b1\'bc\'e4\'c0\'b8
\f0 \
        UIView *itemTimeView = [[UIView alloc] initWithFrame:CGRectMake(0, y, CGRectGetWidth(_mainTableView.frame), 22)];\
        itemTimeView.backgroundColor = RGB(139, 132, 112);\
        [cell.contentView addSubview:itemTimeView];\
        \
        UILabel *itemTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(28, 0, CGRectGetWidth(itemTimeView.frame) - 28, CGRectGetHeight(itemTimeView.frame))];\
        itemTimeLabel.font = [UIFont systemFontOfSize:12];\
        itemTimeLabel.text = [NSString stringWithFormat:@"
\f1 \'ca\'b1\'bc\'e4
\f0  %@", itemTime];\
        itemTimeLabel.textAlignment = NSTextAlignmentLeft;\
        itemTimeLabel.textColor = [UIColor whiteColor];\
        [itemTimeView addSubview:itemTimeLabel];\
        \
        //
\f1 \'cf\'c2\'bb\'ae\'cf\'df
\f0 \
        UIView *underlineView2 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(itemTimeView.frame) - 1, CGRectGetWidth(itemTimeView.frame), 1)];\
        underlineView2.backgroundColor = RGB(209, 209, 209);\
        [itemTimeView addSubview:underlineView2];\
        /******************   
\f1 \'cf\'d4\'ca\'be\'ca\'b1\'bc\'e4\'c0\'b8\'bd\'e1\'ca\'f8
\f0   *******************/\
        //
\f1 \'bc\'c6\'cb\'e3\'b8\'df\'b6\'c8
\f0 \
        totalHeight += CGRectGetHeight(itemTimeView.frame);\
        \
        /******************** 
\f1 \'cf\'d4\'ca\'be\'cf\'ea\'cf\'b8
\f0 item   ************************/\
        y = CGRectGetHeight(itemTimeView.frame) + itemTimeView.frame.origin.y;\
        for (int j = 0; j < itemDetailArray.count; j++) \{\
            NSDictionary *detailDic = [itemDetailArray objectAtIndex:j];\
            NSString *name = detailDic[@"appoint_name"];\
            NSString *phone = detailDic[@"appoint_phone"];\
            NSString *weddingDate = detailDic[@"wedding_date"];\
            NSString *hallTimes = detailDic[@"hall_times"];\
            //NSString *status = detailDic[@"status"];\
            NSString *orderId = detailDic[@"order_id"];\
            NSString *statusDesc = detailDic[@"status_desc"];\
            \
            UIView *itemDetailView = [[UIView alloc] initWithFrame:CGRectMake(0, y, CGRectGetWidth(_mainTableView.frame), 70)];\
            itemDetailView.backgroundColor = [UIColor whiteColor];\
            [cell.contentView addSubview:itemDetailView];\
            \
            UIImageView *arrowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(itemDetailView.frame) - 11 - 18, (CGRectGetHeight(itemDetailView.frame) - 33) / 2, 18, 33)];\
            arrowImageView.image = [UIImage imageNamed:@"icon_arrow_big"];\
            [itemDetailView addSubview:arrowImageView];\
            \
            CGFloat canUserWidth = 0;//
\f1 \'bf\'c9\'ca\'b9\'d3\'c3\'b5\'c4\'b3\'a4\'b6\'c8\'a3\'ac\'cf\'ea\'cf\'b8\'c4\'da\'c8\'dd\'bf\'c9\'ca\'b9\'d3\'c3\'b5\'c4\'b3\'a4\'b6\'c8
\f0 \
            //
\f1 \'cf\'d4\'ca\'be\'ce\'c4\'d7\'d6
\f0 \
            NSString *statusStr = @"";\
            statusStr = statusDesc;\
            \
            CGSize size = [statusStr sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];\
            CGFloat x = arrowImageView.frame.origin.x - size.width - 8;\
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, 0, size.width, CGRectGetHeight(itemDetailView.frame))];\
            label.text = statusStr;\
            label.font = [UIFont systemFontOfSize:15];\
            label.textColor = RGB(224, 32, 32);\
            [itemDetailView addSubview:label];\
            \
            canUserWidth = label.frame.origin.x;\
            \
            //
\f1 \'bb\'ad\'cf\'ea\'cf\'b8\'c4\'da\'c8\'dd\'bb\'ad\'c3\'e6
\f0 \
            UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(28, 14, 0, 0)];\
            UILabel *phoneLabel = [[UILabel alloc] init];\
            \
            //
\f1 \'cb\'e3\'b3\'f6\'b0\'a1\'c3\'fb\'d7\'d6\'ba\'cd\'b5\'e7\'bb\'b0\'b5\'c4\'d7\'ee\'b4\'f3\'b3\'a4\'b6\'c8
\f0  28
\f1 \'ce\'aa\'d7\'f3\'b1\'df\'be\'e0\'a3\'ac
\f0  6
\f1 \'ce\'aa\'c3\'fb\'d7\'d6\'ba\'cd\'b5\'e7\'bb\'b0\'b5\'c4\'bc\'e4\'b8\'f4
\f0 \
            CGFloat maxWidth = (canUserWidth - 28 - 6) /2;\
            CGSize nameSize = [name sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];\
            CGSize phoneSize = [phone sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];\
            CGFloat phoneY = nameSize.height - phoneSize.height;\
            \
            //
\f1 \'bc\'c6\'cb\'e3\'c3\'fb\'d7\'d6\'ba\'cd\'b5\'e7\'bb\'b0
\f0 Label
\f1 \'b5\'c4
\f0 frame
\f1 \'bf\'ed\'b6\'c8
\f0 \
            if (nameSize.width > maxWidth)\{\
                if (phoneSize.width > maxWidth) \{\
                    //
\f1 \'c3\'fb\'b3\'c6\'ba\'cd\'b5\'e7\'bb\'b0\'b6\'bc\'b4\'f3\'d3\'da\'d7\'ee\'b4\'f3\'b3\'a4\'b6\'c8\'a3\'ac\'cf\'d4\'ca\'be\'b5\'e3\'b5\'e3\'b5\'e3
\f0 \
                    nameLabel.frame = CGRectMake(nameLabel.frame.origin.x, nameLabel.frame.origin.y, maxWidth, nameSize.height);\
                    phoneLabel.frame = CGRectMake(nameLabel.frame.origin.x + 6 + CGRectGetWidth(nameLabel.frame), nameLabel.frame.origin.y + phoneY, maxWidth, phoneSize.height);\
                \}else \{\
                    //
\f1 \'c3\'fb\'d7\'d6\'b3\'ac\'b9\'fd\'d7\'ee\'b4\'f3\'b3\'a4\'b6\'c8\'a3\'ac\'b5\'e7\'bb\'b0\'ce\'b4\'b3\'ac\'b9\'fd\'d7\'ee\'b4\'f3\'b3\'a4\'b6\'c8
\f0 \
                    CGFloat nameWidth = nameSize.width;\
                    if (nameSize.width > (maxWidth + (maxWidth - phoneSize.width)))\{\
                        nameWidth = maxWidth + (maxWidth - phoneSize.width);\
                    \}\
                    nameLabel.frame = CGRectMake(nameLabel.frame.origin.x, nameLabel.frame.origin.y, nameWidth, nameSize.height);\
                    phoneLabel.frame = CGRectMake(nameLabel.frame.origin.x + 6 + CGRectGetWidth(nameLabel.frame), nameLabel.frame.origin.y + phoneY, phoneSize.width, phoneSize.height);\
                \}\
            \}else \{\
                if (phoneSize.width > maxWidth) \{\
                    //
\f1 \'c3\'fb\'d7\'d6\'ce\'b4\'b3\'ac\'b9\'fd\'d7\'ee\'b4\'f3\'b3\'a4\'b6\'c8\'a3\'ac\'b5\'e7\'bb\'b0\'b3\'ac\'b9\'fd\'d7\'ee\'b4\'f3\'b3\'a4\'b6\'c8
\f0 \
                    CGFloat phoneWidth = phoneSize.width;\
                    if (phoneSize.width > (maxWidth + (maxWidth - nameSize.width)))\{\
                        phoneWidth = maxWidth + (maxWidth - nameSize.width);\
                    \}\
                    nameLabel.frame = CGRectMake(nameLabel.frame.origin.x, nameLabel.frame.origin.y, nameSize.width, nameSize.height);\
                    phoneLabel.frame = CGRectMake(nameLabel.frame.origin.x + 6 + CGRectGetWidth(nameLabel.frame), nameLabel.frame.origin.y + phoneY, phoneWidth, phoneSize.height);\
                \}else \{\
                    //
\f1 \'c3\'fb\'d7\'d6\'ce\'b4\'b3\'ac\'b9\'fd\'d7\'ee\'b4\'f3\'b3\'a4\'b6\'c8\'a3\'ac\'b5\'e7\'bb\'b0\'ce\'b4\'b3\'ac\'b9\'fd\'d7\'ee\'b4\'f3\'b3\'a4\'b6\'c8
\f0 \
                    nameLabel.frame = CGRectMake(nameLabel.frame.origin.x, nameLabel.frame.origin.y, nameSize.width, nameSize.height);\
                    phoneLabel.frame = CGRectMake(nameLabel.frame.origin.x + 6 + CGRectGetWidth(nameLabel.frame), nameLabel.frame.origin.y + phoneY, phoneSize.width, phoneSize.height);\
                \}\
            \}\
            \
            //
\f1 \'c9\'e8\'d6\'c3\'c3\'fb\'d7\'d6\'c6\'e4\'cb\'fb\'ca\'fd\'be\'dd
\f0 \
            nameLabel.font = [UIFont systemFontOfSize:17];\
            nameLabel.textColor = RGB(51, 51, 51);\
            nameLabel.textAlignment = NSTextAlignmentLeft;\
            nameLabel.text = name;\
            [itemDetailView addSubview:nameLabel];\
            \
            //
\f1 \'c9\'e8\'d6\'c3\'b5\'e7\'bb\'b0\'ca\'fd\'be\'dd
\f0 \
            phoneLabel.font = [UIFont systemFontOfSize:14];\
            phoneLabel.textColor = RGB(224, 32, 32);\
            phoneLabel.textAlignment = NSTextAlignmentLeft;\
            phoneLabel.text = phone;\
            [itemDetailView addSubview:phoneLabel];\
            \
            //
\f1 \'c9\'e8\'d6\'c3\'bb\'e9\'c6\'da
\f0 \
            NSDate *wDate = [CommonUtil getDateForString:weddingDate format:@"yyyy-MM-dd"];\
            NSString *wDateStr = [CommonUtil getStringForDate:wDate format:@"yyyy
\f1 \'c4\'ea
\f0 MM
\f1 \'d4\'c2
\f0 dd
\f1 \'c8\'d5
\f0 "];\
            //
\f1 \'c5\'d0\'b6\'cf\'b8\'f1\'ca\'bd\'ca\'c7\'b7\'f1\'b4\'ed\'ce\'f3\'a3\'ac\'b8\'f1\'ca\'bd\'b4\'ed\'ce\'f3\'cf\'d4\'ca\'be\'bb\'e9\'c6\'da\'d4\'dd\'ce\'de
\f0 \
            if ([CommonUtil isEmpty:wDateStr]) \{\
                wDateStr = _defaultWeddingDate;\
            \}\
            NSString *weddingStr = [NSString stringWithFormat:@"
\f1 \'bb\'e9\'c6\'da\'a3\'ba
\f0 %@
\f1 \'a3\'a8
\f0 %@
\f1 \'a3\'a9
\f0 ", wDateStr, hallTimes];\
            CGSize weddingSize = [weddingStr sizeWithFont:[UIFont systemFontOfSize:11] constrainedToSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];\
            UILabel *weddingLabel = [[UILabel alloc] initWithFrame:CGRectMake(nameLabel.frame.origin.x, nameLabel.frame.origin.y + nameLabel.frame.size.height + 12, canUserWidth, weddingSize.height)];\
            weddingLabel.textAlignment = NSTextAlignmentLeft;\
            weddingLabel.text = weddingStr;\
            weddingLabel.font = [UIFont systemFontOfSize:11];\
            weddingLabel.textColor = RGB(102, 102, 102);\
            [itemDetailView addSubview:weddingLabel];\
            \
            //
\f1 \'cf\'c2\'bb\'ae\'cf\'df
\f0 \
            UIView *underline = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(itemDetailView.frame) - 1, CGRectGetWidth(itemDetailView.frame), 1)];\
            underline.backgroundColor = RGB(209, 209, 209);\
            [itemDetailView addSubview:underline];\
            \
            //button\
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];\
            button.frame = CGRectMake(0, 0, CGRectGetWidth(itemDetailView.frame), CGRectGetHeight(itemDetailView.frame));\
            button.backgroundColor = [UIColor clearColor];\
            button.tag = [orderId integerValue];\
            [button addTarget:self action:@selector(clickForDetail:) forControlEvents:UIControlEventTouchUpInside];\
            [itemDetailView addSubview:button];\
            \
            y += CGRectGetHeight(itemDetailView.frame);\
            totalHeight += CGRectGetHeight(itemDetailView.frame);\
        \}\
        \
    \}\
    \
    cell.backgroundColor = [UIColor clearColor];\
    cell.selectionStyle = UITableViewCellSelectionStyleNone;//
\f1 \'b2\'bb\'bf\'c9\'b5\'e3\'bb\'f7
\f0 \
    CGRect frame = cell.frame;\
    frame.size.height = totalHeight;\
    cell.frame = frame;\
    return cell;\
\}\
}