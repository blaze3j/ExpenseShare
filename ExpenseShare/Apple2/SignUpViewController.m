//
//  SignUpViewController.m
//  RoomieHelper
//
//  Created by Joanne Kao on 11/14/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SignUpViewController.h"
#import "LoginViewController.h"
#import "DataAccess.h"
#import "Profile.h"

@implementation SignUpViewController
@synthesize SignUpButton;
@synthesize Name;
@synthesize Email;
@synthesize Re_Email;
@synthesize Password;
@synthesize Re_Password;
@synthesize Cancel;



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	[Name resignFirstResponder];
	[Email resignFirstResponder];
	[Re_Email resignFirstResponder];
	[Password resignFirstResponder];
	[Re_Password resignFirstResponder];
}

-(IBAction) signUp_OnClick: (id) sender {
	
	if (self.isValidSignUp)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Success!"
                                                       message:@"You have successfully created an account! Please log in with the login page."
                                                      delegate:self
                                             cancelButtonTitle:@"Cancel"
                                             otherButtonTitles:@"OK",nil];
		[alert show];
        
        Profile* profile = [[Profile alloc] initWithName:self.Name.text WithEmail:self.Email.text WithPassword:self.Password.text];
        DataAccess* db = [[DataAccess alloc] init];
        
        [db setProfileBySignUpWithProfile:profile];
	}
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
	if(textField == Name) {
        [Email becomeFirstResponder];
    }
	else if(textField == Email) {
        [Re_Email becomeFirstResponder];			
	}
	else if(textField == Re_Email) {
        [Password becomeFirstResponder];			
	}
	else if(textField == Password) {
        [Re_Password becomeFirstResponder];			
	}
	else if(textField == Re_Password) {
        [textField resignFirstResponder];
		[self signUp_OnClick:nil];
		return YES;
    }
    return NO;
}

-(BOOL)isValidSignUp{
	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error"
												   message:@"Invalid sign up info! Please try again!"
												  delegate:self
										 cancelButtonTitle:@"Cancel"
										 otherButtonTitles:@"OK",nil];
	
	NSString *newMessage;
	if (self.Email.text.length == 0) {
		newMessage = @"Sorry, the email listed is invalid.";
		[alert setMessage:newMessage];
		[alert show];
//		[alert release];
		return FALSE;
	}
	else if (self.Password.text.length == 0 ) {
		newMessage = @"Sorry, your password is too short.";
		[alert setMessage:newMessage];
		[alert show];
//		[alert release];
		return FALSE;
	}
	else if (![self.Email.text isEqualToString: self.Re_Email.text]) {
		newMessage = @"Sorry, your emails do not match.";
		[alert setMessage:newMessage];
		[alert show];
//		[alert release];
		return FALSE;
	}
	else if (![self.Password.text isEqualToString: self.Re_Password.text]) {
		newMessage = @"Sorry, your passwords do not match.";
		[alert setMessage:newMessage];
		[alert show];
//		[alert release];
		return FALSE;
	}
	else if (self.Name.text.length == 0) {
		newMessage = @"Sorry, your name is too short.";
		[alert setMessage:newMessage];
		[alert show];
//		[alert release];
		return FALSE;
	}
	
	return TRUE;
}

-(IBAction)cancel_OnClick: (id) sender {
	
	LoginViewController *logIn_Screen = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:[NSBundle mainBundle]];	
	[[self view] addSubview:logIn_Screen.view];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
    self.SignUpButton = nil;
    self.Name = nil;
    self.Email = nil;
    self.Re_Email = nil;
    self.Password = nil;
    self.Re_Password = nil;
    self.Cancel = nil;
}

- (void)dealloc {
//    [super dealloc];
}

@end