//
//  Member.h
//  Apple2
//
//  Created by jhsiao on 12/13/12.
//
//

#import <Foundation/Foundation.h>

@interface Member : NSObject
{
    NSString* mName;
    NSString* mEmail;
    BOOL mAccepted;
}

- (id)initWithName:(NSString*) name WithEmail:(NSString*) email;

- (NSString*)getName;
- (NSString*)getEmail;
- (BOOL)getAccepted;

- (void)setAccepted:(BOOL) accepted;

@end
