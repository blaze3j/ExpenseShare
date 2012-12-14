//
//  EventTableViewCell.h
//  Apple2
//
//  Created by jhsiao on 11/27/12.
//
//

#import <UIKit/UIKit.h>
#import "Event.h"

@interface EventTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *eventLabel;
@property (nonatomic, weak) IBOutlet UILabel *dateLabel;

@property (nonatomic, strong) Event *event;

@end
