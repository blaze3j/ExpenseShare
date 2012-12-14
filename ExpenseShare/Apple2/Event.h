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
    NSString* mType;
    NSDate* mDate;
    NSString* mFrequency;
    NSString* mTerm;
    NSNumber* mCost;
}

- (id)initWithType:(NSString*) type WithFrequency:(NSString*) frequency WithTerm:(NSString*) term WithCost:(NSNumber*) cost WithDateInterval:(NSTimeInterval) interval;
- (NSString*)getType;
- (NSString*)getFrequency;
- (NSString*)getTerm;
- (NSNumber*)getCost;
- (NSString*)getDateAsString;
- (NSTimeInterval)getDateAsTimeInterval;
- (NSDate*)getDate;

- (void)setType:(NSString*) type;
- (void)setFrequency:(NSString*) freq;
- (void)setTerm:(NSString*) term;
- (void)setCost:(NSNumber*) cost;
- (void)setDate:(NSDate*) date;

@end
