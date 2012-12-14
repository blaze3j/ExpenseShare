//
//  FeedTableViewCell.m
//  Apple2
//
//  Created by jhsiao on 11/27/12.
//
//

#import "FeedTableViewCell.h"

@implementation FeedTableViewCell
@synthesize feedTextView;
@synthesize feed;

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

- (void)setFeed:(NSString*)newFeed {
    
    if (feed != newFeed) {
        feed = newFeed;
        
        feedTextView.text = feed;
    }
}
@end
