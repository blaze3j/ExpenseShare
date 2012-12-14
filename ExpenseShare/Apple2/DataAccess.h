//
//  DataAccess.h
//  Apple2
//
//  Created by jhsiao on 12/1/12.
//
//

#import <Foundation/Foundation.h>
#import "/usr/include/sqlite3.h"
#import "Profile.h"

@interface DataAccess : NSObject
{
    NSString *mDatabasePath;
    sqlite3 *mDb;
}

- (int) setProfileBySignUpWithProfile:(Profile*) profile;
- (int) setProfileByGroupWithProfile:(Profile *)profile;
- (Profile*) getProfileWithEmail:(NSString*) email;

- (NSMutableArray*) getEventsForProfile:(Profile*) profile;
- (int) setEventsForProfile:(Profile*) profile;

@end
