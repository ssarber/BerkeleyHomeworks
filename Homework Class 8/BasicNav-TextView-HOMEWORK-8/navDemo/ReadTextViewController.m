//
//  ReadTextViewController.m
//  navDemo
//
//  Created by ssarber on 10/27/12.
//
//

#import "ReadTextViewController.h"


@implementation ReadTextViewController

@synthesize textView;

- (void)dealloc
{
	[textView release];
	[super dealloc];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
    NSError * error = nil;
	
	self.title = NSLocalizedString(@"Here's what you wrote", @"");
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    self.textView = [[[UITextView alloc] initWithFrame:screenRect] autorelease];
    self.textView.editable = NO;
    self.textView.backgroundColor = [UIColor lightGrayColor];
	[self.view addSubview:textView];
    
    TextViewController *twc = [[TextViewController alloc]init];
    NSString *fileName = [twc textArchivePath];
    
    //Read the text file.
    NSString *megaText = [[NSString alloc]
                                       initWithContentsOfFile:fileName
                                       encoding:NSUTF8StringEncoding
                                       error:&error];
    if (error)
    {
        NSLog(@"Error reading file at %@\n%@\n",
              fileName, [error localizedFailureReason]);
        error = nil;
    }

    self.textView.text = megaText;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    
}

- (void)viewDidUnload
{
	[super viewDidUnload];
	
	self.textView = nil;
    NSLog(@"viewDidUnload:");
}

@end
