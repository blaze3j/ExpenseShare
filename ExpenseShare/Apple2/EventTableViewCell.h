//
//  EventTableViewCell.h
//  Apple2
//
//  Created by jhsiao on 11/27/12.
//
//

#import <UIKit/UIKit.h>

@interface EventTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UITextView *eventTextView;

@property (nonatomic, strong) NSArray* events;

@end
