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
    NSString* mGroup;
    NSString* mImagePath;
    NSNumber* mOwe;
    NSNumber* mOwed;
}

- (NSString*)getName;
- (NSString*)getGroup;
- (UIImage*)getImage;
- (NSString*)getOweAsString;
- (NSString*)getOwedAsString;


@end
