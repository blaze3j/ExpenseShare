//
//  CostDetailController.h
//  Apple2
//
//  Created by Pei-fen Tu on 11/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CostDetailDelegate<NSObject>
- (void) costAmount:(NSString*) selectedItem: (NSString*) amount;
@end

@interface CostDetailController : UIViewController
@property (nonatomic, weak) id <CostDetailDelegate> delegate;
@property (retain,nonatomic) IBOutlet UITextField* textField;
@property (nonatomic, strong) NSString* amount; 
- (IBAction)reset:(UIBarButtonItem*)sender;
@end
