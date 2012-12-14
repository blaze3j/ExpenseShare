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

- (void) setProfileBySignUpWithProfile:(Profile*) profile;
- (Profile*) getProfileWithEmail:(NSString*) email WithPassword:(NSString*) password;

@end
