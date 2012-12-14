//
//  ProfileTableViewCell.h
//  Apple2
//
//  Created by jhsiao on 11/25/12.
//
//

#import <UIKit/UIKit.h>
#import "Profile.h"

@interface ProfileTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *oweLabel;
@property (nonatomic, weak) IBOutlet UILabel *owedLabel;
@property (nonatomic, strong) Profile *profile;

@end
