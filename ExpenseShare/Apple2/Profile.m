//
//  Profile.m
//  Apple2
//
//  Created by jhsiao on 11/25/12.
//
//

#import "Profile.h"
#import "Event.h"

@implementation Profile

//- (id)init
//{
//    self = [super init];
//    if (self)
//    {
//        mName = @"Jenny";
//        mEmail = @"Jenny@gmail.com";
//        mPassword = @"jennypass";
//        mGroup = @"LoveLoveHouse";
//        mImagePath = @"osx.jpg";
//        mOwe = [NSNumber numberWithFloat:10.0];
//        mOwed = [NSNumber numberWithFloat:2.5];
//    }
//    return self;
//}

- (id)initWithName:(NSString*) name WithEmail:(NSString*) email WithPassword:(NSString*) password
{
    self = [super init];
    if (self)
    {
        mName = name;
        mEmail = email;
        mPassword = password;
        mGroup = @"LoveLoveHouse";
        mImagePath = @"osx.jpg";
        mOwe = [NSNumber numberWithFloat:0.0];
        mOwed = [NSNumber numberWithFloat:0.0];
        mEvents = [NSMutableArray array];
        mMembers = [NSMutableArray array];
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

- (NSString*)getPassword
{
    return mPassword;
}

- (NSString*)getGroup
{
    return mGroup;
}

-(NSString*)getImagePath
{
    return mImagePath;
}

- (UIImage*)getImage
{
    return [UIImage imageNamed:mImagePath];
}

- (NSNumber*)getOwe
{
    return mOwe;
}

- (NSString*)getOweAsString
{
    return [NSString stringWithFormat:@"$%.2f", [mOwe floatValue]];
}

- (NSNumber*)getOwed
{
    return mOwed;
}

- (NSString*)getOwedAsString
{
    return [NSString stringWithFormat:@"$%.2f", [mOwed floatValue]];
}

- (NSMutableArray*) getEvents
{
    return mEvents;
}

- (NSMutableArray*) getMembers
{
    return mMembers;
}

- (NSNumber*)getIndividualCost
{
    float total = 0.0;
    for (Event* e in mEvents)
    {
        NSString* term = [e getTerm];
        if ([term isEqualToString:@"Divide evenly"])
        {
            total += [[e getCost] floatValue] / (float) [mMembers count];
        }
        else if ([term isEqualToString:@"Take turns"])
        {
            total += [[e getCost] floatValue];
        }
        else
        {
            total += [[e getCost] floatValue];
        }
    }
    return [NSNumber numberWithFloat:total];
}

- (NSNumber*)getDueEventCount
{
    NSDate* today = [NSDate date];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setDateFormat:@"yyyy'/'MM'/'dd'"];
    
    NSString* todayString = [dateFormatter stringFromDate:today];
    NSLog(@"formattedDateString: %@", todayString);
    
    float count = 0.0;
    
    for (Event* e in mEvents)
    {
        if (false == [[e getDateAsString] isEqualToString:todayString])
            continue;
        count++;
    }
    
    return [NSNumber numberWithFloat:count];
}

- (NSString*)getIndividualOweAsString
{
    return [NSString stringWithFormat:@"$%.02f", [[self getIndividualCost] floatValue]];
}

- (void)setProfileWithProfile:(Profile*) profile
{
    mName = [profile getName];
    mEmail = [profile getEmail];
    mPassword = [profile getPassword];
    mGroup = [profile getGroup];
    mImagePath = [profile getImagePath];
    mOwe = [profile getOwe];
    mOwed = [profile getOwed];
    mEvents = [NSMutableArray arrayWithArray:[profile getEvents]];
    mMembers = [NSMutableArray arrayWithArray:[profile getMembers]];
}

- (void)setGroup:(NSString*)group
{
    mGroup = group;
}

- (void)setOwed:(NSNumber*) owed
{
    mOwed = owed;
}

- (void)setOwe:(NSNumber*) owe
{
    mOwe = owe;
}

- (void)setEvents:(NSMutableArray*) events
{
    mEvents = events;
}

- (void)setMembers:(NSMutableArray*) members
{
    mMembers = members;
}

@end
