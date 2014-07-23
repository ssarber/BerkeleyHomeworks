//
//  MasterViewController.h
//  navDemo
//
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "internalViewsViewController.h"
#import "TextViewController.h"
#import "ReadTextViewController.h"
@class DetailViewController;

@interface MasterViewController : UITabBarController

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) internalViewsViewController *internalViewsViewController;
@property (strong, nonatomic) TextViewController *textViewController;
@property (strong, nonatomic) ReadTextViewController *readTextViewController;

@end
