//
//  DataAccess.h
//  Apple2
//
//  Created by jhsiao on 12/1/12.
//
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Profile.h"

@interface DataAccess : NSObject
{
    NSString *mDatabasePath;
    sqlite3 *mDb;
}

- (int) setProfileBySignUpWithProfile:(Profile*) profile;
- (int) setProfileGroupWithProfile:(Profile *)profile;
- (int) setProfileImagePathWithProfile:(Profile *)profile;
- (Profile*) getProfileWithEmail:(NSString*) email;

- (NSMutableArray*) getEventsForProfile:(Profile*) profile;
- (int) setEventsForProfile:(Profile*) profile;

- (NSMutableArray*) getMembersForProfile:(Profile*) profile;
- (int) setMembersForProfile:(Profile*) profile;

@end
