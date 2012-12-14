//
//  OtherDetailView.m
//  Apple2
//
//  Created by Pei-fen Tu on 11/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OtherDetailView.h"

@implementation OtherDetailView
@synthesize selectedName = _selectedName, textField = _textField, label = _label, curType = _curType;
@synthesize delegate = _delegate;
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
    [super viewDidLoad];
    
    switch (self.selectedName) {
        case 0:
            [self.label setText:@"Type: "];
            [self.textField setText:self.curType];
            break;
        case 2:
            [self.label setText:@"Pay By: "];
            [self.textField setText:self.curType];
            break;
        default:
            break;
    }
 
    [self.textField addTarget:self action:@selector(textFieldFinished:) forControlEvents:UIControlEventEditingDidEndOnExit];
}

- (void)viewDidUnload
{
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        // back button was pressed.  We know this is true because self is no longer
        // in the navigation stack.
        NSLog(@"test");
    }
    [super viewWillDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)textFieldFinished:(id)sender
{
    NSLog(@"%s", __FUNCTION__);
    [sender resignFirstResponder];
}

- (IBAction)done:(id)sender;
{
    NSLog(@"%s", __FUNCTION__);
    [self.delegate currentLabel:self.textField.text];
    [self.view endEditing:YES];
}


@end
