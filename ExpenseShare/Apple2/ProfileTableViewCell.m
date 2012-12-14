//
//  ProfileTableViewCell.m
//  Apple2
//
//  Created by jhsiao on 11/25/12.
//
//

#import "ProfileTableViewCell.h"

@implementation ProfileTableViewCell
@synthesize oweLabel;
@synthesize owedLabel;
@synthesize profile;

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

- (void)setProfile:(Profile*)newProfile {
    
    if (profile != newProfile) {
        profile = newProfile;

        oweLabel.text = [profile getIndividualOweAsString];
        owedLabel.text = [profile getOwedAsString];
    }
}

@end
