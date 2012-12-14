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
#import "ActiveProfile.h"

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

-(IBAction)login_OnClick: (id)sender {

    if (Password.text.length != 0 && Email.text.length == 0)
    {
		return;
	}
    
	if (self.isValidLogin == NO)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error"
                                                       message:@"Failed to login! Please try again!"
                                                      delegate:self
                                             cancelButtonTitle:nil
                                             otherButtonTitles:@"OK",nil];
        [alert show];
	}
	else
    {
        [sender resignFirstResponder];
        [self performSegueWithIdentifier:@"CreateGroupTableViewController" sender:sender];
	}
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
	if (textField == Email)
    {
        [Password becomeFirstResponder];
    }
    return NO;
}

-(BOOL)isValidLogin {    
    NSLog(@"%@:%@", self.Email.text, self.Password.text);
    	
    DataAccess* db = [[DataAccess alloc] init];
    Profile* profile = [db getProfileWithEmail:self.Email.text];
    
    if (nil == profile)
    {
        NSLog(@"%s: profile not found.", __FILE__);
        return NO;
    }
    
    if (![self.Password.text isEqualToString:[profile getPassword]])
        return NO;

    [profile setEvents:[db getEventsForProfile:profile]];
    [profile setMembers:[db getMembersForProfile:profile]];
    Profile* activeProfile = [ActiveProfile sharedInstance];
    [activeProfile setProfileWithProfile:profile];
    
	return YES;
}

-(void)setEmailText:(NSString*) email
{
    self.Email.text = email;
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
