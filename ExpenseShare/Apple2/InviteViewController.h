//
//  InviteViewController.h
//  CreateGroup
//
//  Created by Xiaofan Sun on 11/15/12.
//  Copyright (c) 2012 Xiaofan Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InviteProtocol<NSObject>
    -(void) updateMembers: (NSString*) data;
@end

@interface InviteViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtInviteEmail;
@property (weak, nonatomic) IBOutlet UITextView *txtInviteContent;

@property (nonatomic, weak) id <InviteProtocol> delegate;

- (IBAction)btnInviteSubmit:(id)sender;

@end
