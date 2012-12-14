//
//  Created by Joanne Kao on 10/29/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RoomieHelperViewController;
@class SignUpViewController;

@interface RoomieHelperAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    RoomieHelperViewController *viewController;
	SignUpViewController *su_viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RoomieHelperViewController *viewController;
@property (nonatomic, retain) IBOutlet SignUpViewController *su_viewController;

@end

