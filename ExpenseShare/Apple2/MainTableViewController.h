//
//  MainTableViewController.h
//  Apple2
//
//  Created by jhsiao on 11/24/12.
//
//

#import <UIKit/UIKit.h>
#import "ProfileTableViewCell.h"
#import "EventTableViewCell.h"
#import "FeedTableViewCell.h"

@interface MainTableViewController : UITableViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    UIImagePickerController* mPicker;
    IBOutlet UIImageView* mSelectedImage;
}

@property (strong, nonatomic) IBOutlet ProfileTableViewCell *profileCell;
@property (strong, nonatomic) IBOutlet EventTableViewCell *upcomingEventCell;
@property (nonatomic, retain) UIImageView* mSelectedImage;
@property (strong, nonatomic) IBOutlet UIButton *imageButton;


- (IBAction) getImage;

@end
