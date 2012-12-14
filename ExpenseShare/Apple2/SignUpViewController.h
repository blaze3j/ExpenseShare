//
//  SignUpViewController.h
//  RoomieHelper
//
//  Created by Joanne Kao on 11/14/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController <UITextFieldDelegate>{
	
	IBOutlet UIButton *SignUpButton;
	IBOutlet UITextField *Name;
	IBOutlet UITextField *Email;
	IBOutlet UITextField *Re_Email;
	IBOutlet UITextField *Password;
	IBOutlet UITextField *Re_Password;
	IBOutlet UIBarButtonItem *Cancel;
}

@property (nonatomic, retain) UIButton *SignUpButton;
@property (nonatomic, retain) UITextField *Name;
@property (nonatomic, retain) UITextField *Email;
@property (nonatomic, retain) UITextField *Re_Email;
@property (nonatomic, retain) UITextField *Password;
@property (nonatomic, retain) UITextField *Re_Password;
@property (nonatomic, retain) UIBarButtonItem *Cancel;

-(IBAction) signUp_OnClick: (id) sender;
-(IBAction) cancel_OnClick: (id) sender;
-(BOOL)isValidSignUp;

@end