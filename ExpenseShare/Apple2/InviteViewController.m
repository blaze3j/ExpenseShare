//
//  InviteViewController.m
//  CreateGroup
//
//  Created by Xiaofan Sun on 11/15/12.
//  Copyright (c) 2012 Xiaofan Sun. All rights reserved.
//

#import "InviteViewController.h"

@interface InviteViewController ()

@end

@implementation InviteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTxtInviteEmail:nil];
    [self setTxtInviteContent:nil];
    [super viewDidUnload];
}

- (void)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.txtInviteEmail) {
        [theTextField resignFirstResponder];
    }
}


- (IBAction)btnInviteSubmit:(id)sender {
    
    [self.txtInviteEmail resignFirstResponder];
    [self.txtInviteContent resignFirstResponder];
        
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Invite"
                                                      message:[self.txtInviteEmail text]
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [message show];
    
}
@end