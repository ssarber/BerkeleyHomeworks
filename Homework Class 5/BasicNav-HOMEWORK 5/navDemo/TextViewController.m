#import "TextViewController.h"

@implementation TextViewController

@synthesize textView;

// iOS 6
- (BOOL)shouldAutorotate {
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (void)dealloc
{
	[textView release];
	[super dealloc];
}

- (void)setupTextView
{
    CGRect screenRect = CGRectMake(20.0f, 20.0f, 280.0f, 220.0f);
    // CGRect screenRect = [[UIScreen mainScreen] bounds];
    self.textView = [[[UITextView alloc] initWithFrame:screenRect] autorelease];
   // self.textView.returnKeyType = UIReturnKeyDone;
    
	self.textView.textColor = [UIColor blackColor];
	self.textView.font = [UIFont fontWithName:@"Arial" size:18.0];
	self.textView.delegate = self;
	self.textView.backgroundColor = [UIColor lightGrayColor];


	self.textView.text = @"The path of the righteous man is beset on all sides by the iniquities of the selfish and the tyranny of evil men.\n\n";
	self.textView.returnKeyType = UIReturnKeyDefault;
	self.textView.keyboardType = UIKeyboardTypeDefault;	// use the default type input method (entire keyboard)
	self.textView.scrollEnabled = YES;
	
	// this will cause automatic vertical resize when the table is resized
	self.textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
	
	// note: for UITextView, if you don't like autocompletion while typing use:
	// myTextView.autocorrectionType = UITextAutocorrectionTypeNo;
	
	//[self.view addSubview: self.textView];
    [self.view addSubview:textView];

}

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.title = NSLocalizedString(@"Write Something", @"");
	[self setupTextView];
}


// called after the view controller's view is released and set to nil.
// For example, a memory warning which causes the view to be purged. Not invoked as a result of -dealloc.
// So release any properties that are loaded in viewDidLoad or can be recreated lazily.
//
- (void)viewDidUnload
{
	[super viewDidUnload];
	
	self.textView = nil;
    NSLog(@"viewDidUnload:");
}


- (void)saveAction
{
	// Text view has been dismissed. Resign first responder, which will remove the keypad.
	[self.textView resignFirstResponder];
    
    // this will remove the "save" button
	self.navigationItem.rightBarButtonItem = nil;
	
    //This is your opportunity to save the text.
    NSLog(@"%@", self.textView.text);
}


- (void)triggerSaveAlert:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hold on a sec..."
                                                    message:@"Are you quite sure you wanna save this?"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"OK", nil];
    [alert show];
    [alert release];
}


- (void)alertView:(UIAlertView *)alert clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        // do nothing
    }
    if (buttonIndex == 1)
    {
        [self saveAction];
    }
}

#pragma mark -
#pragma mark UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView
{
	// provide my own Save button to dismiss the keyboard
	UIBarButtonItem* saveItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(triggerSaveAlert:)];
    
	self.navigationItem.rightBarButtonItem = saveItem;
    self.textView.backgroundColor = [UIColor greenColor];
    NSLog(@"textViewShouldBeginEditing:");
    [saveItem release];
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    NSLog(@"textViewShouldEndEditing:");
    self.textView.backgroundColor = [UIColor whiteColor];
    return YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView{

    NSLog(@"textViewDidEndEditing:");
}


@end

