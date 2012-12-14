//
//  CreateGroupTableViewController.h
//  CreateGroup
//
//  Created by Xiaofan Sun on 11/15/12.
//  Copyright (c) 2012 Xiaofan Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateGroupTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnCreateGroup;

@property (weak, nonatomic) IBOutlet UITableViewCell *tblcelCreateGroupJoanne;
@property (weak, nonatomic) IBOutlet UITableViewCell *tblcelCreateGroupIan;
@property (weak, nonatomic) IBOutlet UITableViewCell *tblcelCreateGroupPeifen;
@property (weak, nonatomic) IBOutlet UITableViewCell *tblcelCreateGroupJerry;

- (IBAction)btnCreateGroupDone:(id)sender;

@end
