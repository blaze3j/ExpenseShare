//
//  Profile.h
//  Apple2
//
//  Created by jhsiao on 11/25/12.
//
//

#import <Foundation/Foundation.h>

@interface Profile : NSObject
{
    NSString* mName;
    NSString* mEmail;
    NSString* mPassword;
    NSString* mGroup;
    NSString* mImagePath;
    NSNumber* mOwe;
    NSNumber* mOwed;
    NSMutableArray* mEvents;
    NSMutableArray* mMembers;
    
    UIImage* mImage;
}

- (id)initWithName:(NSString*) name WithEmail:(NSString*) email WithPassword:(NSString*) password;

- (NSString*)getName;
- (NSString*)getEmail;
- (NSString*)getPassword;
- (NSString*)getGroup;
- (NSString*)getImagePath;
- (UIImage*)getImage;
- (NSNumber*)getOwe;
- (NSString*)getOweAsString;
- (NSNumber*)getOwed;
- (NSString*)getOwedAsString;
- (NSString*)getIndividualOweAsString;
- (NSString*)getDueEventCount;
- (NSMutableArray*)getEvents;
- (NSMutableArray*)getMembers;

- (void)setProfileWithProfile:(Profile*) profile;
- (void)setGroup:(NSString*) group;
- (void)setImagePath:(NSString*) imagePath;
- (void)setOwed:(NSNumber*) owed;
- (void)setOwe:(NSNumber*) owe;
- (void)setEvents:(NSMutableArray*) events;
- (void)setMembers:(NSMutableArray*) members;

@end
