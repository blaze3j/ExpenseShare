//
//  EventTableViewCell.m
//  Apple2
//
//  Created by jhsiao on 11/27/12.
//
//

#import "EventTableViewCell.h"

@implementation EventTableViewCell
@synthesize eventLabel;
@synthesize dateLabel;
@synthesize event;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setEvent:(Event*)newEvent {
    
    if (event != newEvent) {
        event = newEvent;
        
        eventLabel.text = [event getSubject];
        dateLabel.text = [event getDateAsString];
    }
}

@end
