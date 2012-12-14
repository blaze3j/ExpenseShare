//
//  Event.m
//  Apple2
//
//  Created by jhsiao on 11/27/12.
//
//

#import "Event.h"

@implementation Event

- (id)initWithSubject:(NSString*) subject WithDateInterval:(NSTimeInterval) interval
{
    self = [super init];
    if (self)
    {
        mSubject = subject;
        mDate = [NSDate dateWithTimeIntervalSince1970:interval];
    }
    return self;
}

- (NSString*)getSubject
{
    return mSubject;
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

@end
