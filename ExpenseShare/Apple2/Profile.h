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
}

- (id)initWithName:(NSString*) name WithEmail:(NSString*) email WithPassword:(NSString*) password;

- (NSString*)getName;
- (NSString*)getEmail;
- (NSString*)getPassword;
- (NSString*)getGroup;
- (UIImage*)getImage;
- (NSString*)getOweAsString;
- (NSString*)getOwedAsString;


@end
