//
//  MasterViewController.m
//  navDemo
//
//

#import "MasterViewController.h"



@implementation MasterViewController

@synthesize detailViewController = _detailViewController;
@synthesize internalViewsViewController = _internalViewsViewController;
@synthesize textViewController =_textViewController;
@synthesize readTextViewController =_readTextViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Master", @"Master");
    }
    return self;
}

- (void)dealloc
{
    [_detailViewController release];
    [_internalViewsViewController release];
    [_textViewController release];
    [_readTextViewController release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return NO;
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    //If you set a backBarButtonItem here, its title will show in the back button when
    //you go to the next view. If not, the button will show the title of this controller
    //"Master" in initWithNibName above. If there is no title there, the button 
    //will show "Back".
    
    UIBarButtonItem *temporaryBarButtonItem=[[UIBarButtonItem alloc] init];
    temporaryBarButtonItem.title=@"<---";
    self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
    [temporaryBarButtonItem release];
}
#pragma-noise

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}
// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

/***************************** START REQUIRED METHODS ****************************************/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    
    // Configure the cell.
    if (indexPath.row == 0)
        cell.textLabel.text = NSLocalizedString(@"Detail", @"Detail");
    else
        if (indexPath.row == 1)
            cell.textLabel.text = NSLocalizedString(@"Web", @"Web");
        else
            if (indexPath.row == 2)
                cell.textLabel.text = NSLocalizedString(@"Edit Text", @"Edit Text");
            else
                if (indexPath.row == 3)
                    cell.textLabel.text = NSLocalizedString(@"Read Text", @"Read Text");
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source.
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
 }   
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        if (!self.detailViewController) {
            self.detailViewController = [[[DetailViewController alloc] initWithNibName:nil bundle:nil] autorelease];
        }
        [self.navigationController pushViewController:self.detailViewController animated:YES];}
    
    else
        if (indexPath.row == 1)
        {
            if (!self.internalViewsViewController) {
                self.internalViewsViewController = [[[internalViewsViewController alloc] initWithNibName:nil bundle:nil] autorelease];
        }
        [self.navigationController pushViewController:self.internalViewsViewController animated:YES];}
    else
        if (indexPath.row == 2)
        {
            if (!self.textViewController) {
                self.textViewController = [[[TextViewController alloc] initWithNibName:nil bundle:nil] autorelease];
        }
        [self.navigationController pushViewController:self.textViewController animated:YES];}
    
    else
        if (indexPath.row == 3)
        {
            if (!self.readTextViewController) {
                self.readTextViewController = [[[ReadTextViewController alloc] initWithNibName:nil bundle:nil] autorelease];
            }
            [self.navigationController pushViewController:self.readTextViewController animated:YES];}

}
@end
