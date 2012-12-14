//
//  ScheduleTableViewController.h
//  Apple2
//
//  Created by Pei-fen Tu on 11/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "AddSchedule.h"
@interface ScheduleTableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource, AddScheduleProtocol>
//@property(nonatomic, strong) NSMutableArray* scheduleList;
@property (nonatomic, strong) NSMutableArray* dataArray;
@end
