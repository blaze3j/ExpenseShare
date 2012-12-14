//
//  InviteViewController.h
//  CreateGroup
//
//  Created by Xiaofan Sun on 11/15/12.
//  Copyright (c) 2012 Xiaofan Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InviteViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtInviteEmail;
@property (weak, nonatomic) IBOutlet UITextView *txtInviteContent;

- (IBAction)btnInviteSubmit:(id)sender;


@end
