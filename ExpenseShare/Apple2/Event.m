//
//  Event.m
//  Apple2
//
//  Created by jhsiao on 11/27/12.
//
//

#import "Event.h"

@implementation Event

- (id)initWithType:(NSString*) type WithFrequency:(NSString*) frequency WithTerm:(NSString*) term WithCost:(NSNumber*) cost WithDateInterval:(NSTimeInterval) interval
{
    self = [super init];
    if (self)
    {
        mType = type;
        mFrequency = frequency;
        mTerm = term;
        mCost = cost;
        mDate = [NSDate dateWithTimeIntervalSince1970:interval];
    }
    return self;
}

- (NSString*)getType
{
    return mType;
}

- (NSString*)getFrequency
{
    return mFrequency;
}

- (NSString*)getTerm
{
    return mTerm;
}

- (NSNumber*)getCost
{
    return mCost;
}

- (NSString*)getDateAsString
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setDateFormat:@"yyyy'/'MM'/'dd'"];

    NSString* formattedDateString = [dateFormatter stringFromDate:mDate];
    NSLog(@"formattedDateString: %@", formattedDateString);

    return formattedDateString;
}

- (NSTimeInterval)getDateAsTimeInterval
{
    return [mDate timeIntervalSince1970];
}

- (NSDate*)getDate
{
    return mDate;
}

- (void)setType:(NSString*) type
{
    mType = type;
}

- (void)setFrequency:(NSString*) freq
{
    mFrequency = freq;
}

- (void)setTerm:(NSString*) term
{
    mTerm = term;
}

- (void)setCost:(NSNumber*) cost
{
    mCost = cost;
}

- (void)setDate:(NSDate*) date
{
    mDate = date;
    NSLog(@"%@ %@", mDate, date);
}


@end
