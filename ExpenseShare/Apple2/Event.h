//
//  Event.h
//  Apple2
//
//  Created by jhsiao on 11/27/12.
//
//

#import <Foundation/Foundation.h>

@interface Event : NSObject
{
    NSString* mSubject;
    NSDate* mDate;
}

- (id)initWithSubject:(NSString*) subject WithDateInterval:(NSTimeInterval) interval;
- (NSString*)getSubject;
- (NSString*)getDateAsString;

@end
