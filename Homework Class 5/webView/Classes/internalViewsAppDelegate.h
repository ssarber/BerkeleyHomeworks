//
//  internalViewsAppDelegate.h
//  internalViews
//
//  Created by David Rowland on 3/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class internalViewsViewController;

@interface internalViewsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    internalViewsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet internalViewsViewController *viewController;

@end

