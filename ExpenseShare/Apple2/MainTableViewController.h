//
//  MainTableViewController.h
//  Apple2
//
//  Created by jhsiao on 11/24/12.
//
//

#import <UIKit/UIKit.h>
#import "Profile.h"
#import "ProfileTableViewCell.h"
#import "EventTableViewCell.h"
#import "FeedTableViewCell.h"

@interface MainTableViewController : UITableViewController
{
    Profile* mProfile;
    NSArray* mEventList;
    NSArray* mFeedList;
}

@property (strong, nonatomic) IBOutlet ProfileTableViewCell *profileCell;
@property (strong, nonatomic) IBOutlet EventTableViewCell *upcomingEventCell;
@property (strong, nonatomic) IBOutlet FeedTableViewCell *feedCell;


@end
