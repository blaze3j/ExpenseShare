//
//  OtherDetailView.h
//  Apple2
//
//  Created by Pei-fen Tu on 11/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol OtherDetailDelegate<NSObject>
- (void) currentLabel: (NSString*) label;

@end

@interface OtherDetailView : UIViewController
@property NSInteger selectedName;
@property(nonatomic, strong) NSString* curType;
@property (retain,nonatomic) IBOutlet UILabel* label;
@property (retain,nonatomic) IBOutlet UITextField* textField;
@property (nonatomic, weak) id<OtherDetailDelegate> delegate; 
- (IBAction)done:(id)sender;
//-(void) setSelectedName:(NSInteger)selectedName;
@end
