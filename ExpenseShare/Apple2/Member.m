//
//  Member.m
//  Apple2
//
//  Created by jhsiao on 12/13/12.
//
//

#import "Member.h"

@implementation Member

- (id)initWithName:(NSString*) name WithEmail:(NSString*) email
{
    self = [super init];
    if (self)
    {
        mName = name;
        mEmail = email;
        mAccepted = false;
    }
    return self;
}

- (NSString*)getName
{
    return mName;
}

- (NSString*)getEmail
{
    return mEmail;
}

- (BOOL)getAccepted
{
    return mAccepted;
}

- (void)setAccepted:(BOOL) accepted
{
    mAccepted = accepted;
}

@end
