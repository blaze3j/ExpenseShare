//
//  FirstViewController.m
//  ExpenseShare
//
//  Created by jhsiao on 11/8/12.
//  Copyright (c) 2012 UIUC. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize OwedValue;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [OwedValue setText:[NSString stringWithFormat:@"tst"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
