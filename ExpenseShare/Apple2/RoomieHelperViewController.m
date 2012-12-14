//
//  RoomieHelperViewController.m
//
//  Created by Joanne Kao on 10/29/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "RoomieHelperViewController.h"
#import "SignUpViewController.h"

@implementation RoomieHelperViewController
@synthesize Label;
@synthesize Button;
@synthesize Email;
@synthesize Password;
@synthesize SignUp_Button;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	[Email resignFirstResponder];
	[Password resignFirstResponder];
}

-(IBAction) login_OnClick: (id) sender {
	UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Error"
												   message: @"Email address is invalid! Please try again!"
												  delegate: self
										 cancelButtonTitle:@"Cancel"
										 otherButtonTitles:@"OK",nil];
	
	if (self.isValidLogin == FALSE){
		[alert show];
//		[alert release];
	}
	
	else {
		Label.text = self.Email.text;
	}
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
	if(textField == Email) {
        [Password becomeFirstResponder];
    } else if(textField == Password) {
        [textField resignFirstResponder];
		[self login_OnClick:nil];
		return YES;
    }
    return NO;
}

-(BOOL)isValidLogin{
	NSString *text = self.Email.text;
	if (text.length == 0) {
		return FALSE;
	}
	
	return TRUE;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}
/*
-(IBAction)signUp_OnClick: (id) sender {
	
	SignUpViewController  *signUp_Screen = [[SignUpViewController alloc] initWithNibName:@"SignUpViewController" bundle:[NSBundle mainBundle]];	
									   [[self view] addSubview:signUp_Screen.view];
}

*/
- (void)dealloc {
 //   [super dealloc];
}

@end
