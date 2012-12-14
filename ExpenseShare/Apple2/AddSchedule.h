//
//  AddSchedule.h
//  Apple2
//
//  Created by Pei-fen Tu on 11/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailView.h"
#import "CostDetailController.h"

@protocol AddScheduleProtocol<NSObject>
-(void) updateItems: (NSMutableArray*) data;
@end


@interface AddSchedule : UIViewController<UITableViewDelegate,UITableViewDataSource, DetailViewDelegate, CostDetailDelegate>
//@interface AddSchedule : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) NSMutableDictionary* propList;
@property(nonatomic, strong) NSArray* propKey;

- (IBAction)done:(UIBarButtonItem*)sender;
- (IBAction)cancel:(UIBarButtonItem*)sender;
@end
