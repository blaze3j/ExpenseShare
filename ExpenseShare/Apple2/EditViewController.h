//
//  EditViewController.h
//  Apple2
//
//  Created by Pei-fen Tu on 11/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailView.h"
#import "CostDetailController.h"
#import "Event.h"

@interface EditViewController : UIViewController<UITableViewDelegate,UITableViewDataSource, DetailViewDelegate, CostDetailDelegate>
{
    Event* mEvent;
}
//@interface AddSchedule : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) NSMutableDictionary* propList;
@property(nonatomic, strong) NSArray* propKey;
@property(nonatomic, strong) NSMutableArray* data;
- (IBAction)edit:(UIBarButtonItem*)sender;
- (IBAction)cancel:(UIBarButtonItem*)sender;

- (void)setEvent:(Event*) event;
@end


