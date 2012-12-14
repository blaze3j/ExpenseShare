//
//  DetailView.h
//  Apple2
//
//  Created by Pei-fen Tu on 11/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OtherDetailView.h"
@protocol DetailViewDelegate <NSObject>
- (void) scheduleDetail:(NSString*) selectedItem: (NSString*) choices;
@end


@interface DetailView : UIViewController<UITableViewDataSource, UITabBarDelegate, OtherDetailDelegate>
@property (nonatomic, strong) NSMutableArray* choicesList;
- (IBAction)cancel:(UIBarButtonItem*)sender;
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, weak) id <DetailViewDelegate> delegate;
@property(nonatomic, strong) NSString* choice;

@end
