//
//  Profile.m
//  Apple2
//
//  Created by jhsiao on 11/25/12.
//
//

#import "Profile.h"

@implementation Profile

- (id)init
{
    self = [super init];
    if (self)
    {
        mName = @"Jenny";
        mGroup = @"LoveLoveHouse";
        mImagePath = @"osx.jpg";
        mOwe = [NSNumber numberWithFloat:10.0];
        mOwed = [NSNumber numberWithFloat:2.5];
    }
    return self;
}

- (NSString*)getName
{
    return mName;
}

- (NSString*)getGroup
{
    return mGroup;
}

- (UIImage*)getImage
{
    return [UIImage imageNamed:mImagePath];
}

- (NSString*)getOweAsString
{
    return [NSString stringWithFormat:@"$%.2f", [mOwe floatValue]];
}

- (NSString*)getOwedAsString
{
    return [NSString stringWithFormat:@"$%.2f", [mOwed floatValue]];
}

@end
