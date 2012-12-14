//
//  RoomieHelperViewController.m
//
//  Created by Joanne Kao on 10/29/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"
#import "SignUpViewController.h"
#import "CreateGroupTableViewController.h"
#import "DataAccess.h"

@implementation LoginViewController
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
	
	if (self.isValidLogin == NO)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error"
                                                       message:@"Failed to login! Please try again!"
                                                      delegate:self
                                             cancelButtonTitle:@"Cancel"
                                             otherButtonTitles:@"OK",nil];
        [alert show];
	}
	else
    {
        [self performSegueWithIdentifier:@"CreateGroupTableViewController" sender:sender];
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

-(BOOL)isValidLogin {
	NSString *email = self.Email.text;
	NSString *password = self.Password.text;
    
    NSLog(@"%@:%@", email, password);
    
	if (email.length == 0) {
		return NO;
	}

	if (password.length == 0) {
		return NO;
	}
	
    DataAccess* db = [[DataAccess alloc] init];
    Profile* profile = [db getProfileWithEmail:email WithPassword:password];
    
    if (nil == profile)
    {
        NSLog(@"%s: profile not found.", __FILE__);
        return NO;
    }
    
	return YES;
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
