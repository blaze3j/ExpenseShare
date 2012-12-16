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
@synthesize txtInviteEmail;
@synthesize txtInviteContent;
@synthesize delegate = _delegate;

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
    if (self.delegate == nil) {
        NSLog(@"www....");
    }else{
        NSLog(@"okok");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [self setTxtInviteEmail:nil];
    [self setTxtInviteContent:nil];
    [super viewDidUnload];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField
{
    if (theTextField == self.txtInviteEmail) {
        [theTextField resignFirstResponder];
    }
    
    return YES;
}

-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        // back button was pressed.  We know this is true because self is no longer
        // in the navigation stack.
        NSLog(@"test, in will disappear");
    }
    [super viewWillDisappear:animated];
}

- (IBAction)cancel:(UIBarButtonItem*)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)btnInviteSubmit:(id)sender {
    [self.txtInviteEmail resignFirstResponder];
    [self.txtInviteContent resignFirstResponder];

    if(self.delegate)
        NSLog(@"hahaha in invite");
    else
        NSLog(@"why in invite");
    NSLog(@"%s", __FUNCTION__);
    if (![txtInviteEmail.text isEqualToString:@""] && NSNotFound != [txtInviteEmail.text rangeOfString:@"@"].location) {
        [self.delegate updateMembers:txtInviteEmail.text];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error"
                                                       message:@"Bad email format."
                                                      delegate:self
                                             cancelButtonTitle:nil
                                             otherButtonTitles:@"OK",nil];
        [alert show];   
    }

    [self dismissModalViewControllerAnimated:YES];
}

@end
