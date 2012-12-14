//
//  ActiveProfile.h
//  Apple2
//
//  Created by jhsiao on 12/2/12.
//
//

#import <Foundation/Foundation.h>
#import "Profile.h"

@interface ActiveProfile : Profile

+ (Profile*) sharedInstance;

@end
