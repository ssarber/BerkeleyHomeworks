//
//  MasterViewController.h
//  navDemo
//
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "internalViewsViewController.h"
#import "TextViewController.h"
@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) internalViewsViewController *internalViewsViewController;
@property (strong, nonatomic) TextViewController *textViewController;

@end
