//
//  FeedTableViewCell.h
//  Apple2
//
//  Created by jhsiao on 11/27/12.
//
//

#import <UIKit/UIKit.h>

@interface FeedTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UITextView *feedTextView;

@property (nonatomic, strong) NSString *feed;

@end
