//
//  ActiveProfile.m
//  Apple2
//
//  Created by jhsiao on 12/2/12.
//
//

#import "ActiveProfile.h"

@implementation ActiveProfile

static Profile *sharedInstance = nil;
static dispatch_once_t onceToken;

+ (Profile*) sharedInstance
{
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Profile alloc] init];
    });
    return sharedInstance;
}

- (Profile*) setActiveWithProfile:(Profile*) profile
{
    if (nil == profile)
        return nil;
    
    [sharedInstance setProfileWithProfile:profile];
    
    return sharedInstance;
}
@end
