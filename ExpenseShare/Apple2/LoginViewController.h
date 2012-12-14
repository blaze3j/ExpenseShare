//
//  LoginViewController.h
//
//  Created by Joanne Kao on 10/29/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>
{
	IBOutlet UILabel *Label;
	IBOutlet UIButton *Button;
	IBOutlet UITextField *Email;
	IBOutlet UITextField *Password;
	IBOutlet UIButton *SignUp_Button;
    
    NSString* mEmail;
}

@property (nonatomic, retain) UILabel *Label;
@property (nonatomic, retain) UIButton *Button;
@property (nonatomic, retain) UITextField *Email;
@property (nonatomic, retain) UITextField *Password;
@property (nonatomic, retain) UIButton *SignUp_Button;

-(IBAction) login_OnClick: (id) sender;
//-(IBAction) signUp_OnClick: (id) sender;
-(BOOL)isValidLogin;
-(void)setEmailText:(NSString*) email;

@end

