//
//  CostDetailController.m
//  Apple2
//
//  Created by Pei-fen Tu on 11/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CostDetailController.h"

@implementation CostDetailController
@synthesize delegate = _delegate, textField = _textField, amount= _amount;
#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [self.textField setText:self.amount];
//    [self.textField setReturnKeyType:UIReturnKeyDone];
//    [self.textField addTarget:self action:@selector(textFieldFinished:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [super viewDidLoad];
}

-(void) viewWillDisappear:(BOOL)animated
{
    self.amount = [self.textField text];
    [self.delegate costAmount:@"Cost" :[self.textField text]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)reset:(UIBarButtonItem *)sender
{
    self.amount = @"";
    [self.textField setText:self.amount];
}
/*
- (IBAction)textFieldFinished:(id)sender
{
     [sender resignFirstResponder];
}
*/


@end
