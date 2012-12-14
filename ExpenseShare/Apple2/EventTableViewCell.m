//
//  EventTableViewCell.m
//  Apple2
//
//  Created by jhsiao on 11/27/12.
//
//

#import "EventTableViewCell.h"
#import "Event.h"

@implementation EventTableViewCell
@synthesize eventTextView;
@synthesize events;

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

- (void)setEvents:(NSArray*)newEvents {
    
    events = newEvents;

    if (0 == [events count])
    {
        eventTextView.text = @"";
        return;
        
    }
    events = newEvents;
    
    NSMutableArray* eventStringArray = [NSMutableArray array];
    for (Event* e in events)
    {
        NSString* eventLine = [NSString stringWithFormat:@"%@ owe %.02f for %@", [e getDateAsString], [[e getCost] floatValue], [e getType]];
        
        [eventStringArray addObject:eventLine];
    }

    eventTextView.text = [eventStringArray componentsJoinedByString:@"\n"];
}

@end
