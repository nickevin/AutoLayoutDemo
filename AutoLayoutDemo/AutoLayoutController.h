//
//  AutoLayoutController.h
//  AutoLayoutDemo
//
//  Created by Kevin Nick on 2014-6-7.
//  Copyright (c) 2014年 NZ Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SWTableViewCell.h"

@interface AutoLayoutController
    : UIViewController <UITableViewDelegate, UITableViewDataSource,
                        SWTableViewCellDelegate>

@end
