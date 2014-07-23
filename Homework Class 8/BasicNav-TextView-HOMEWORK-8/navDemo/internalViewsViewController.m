//
//  internalViewsViewController.m
//  internalViews
//
//  Created by David Rowland on 3/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "internalViewsViewController.h"

@implementation internalViewsViewController

@synthesize webView;
@synthesize backButton;
@synthesize forwardButton;

/*
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization
 }
 return self;
 }
 */



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Apple's website ONLY";
    
    //for web views, we must #import <UIKit/UIKit.h>,
    //reference the UIKit framework,
    // CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    webView = [[UIWebView alloc] initWithFrame:screenRect];
    //[webView setBackgroundColor:[UIColor clearColor]];
    [webView setDelegate:self];
    [webView setScalesPageToFit:YES];
    
    [self.view addSubview:webView];
    //[self setView:webView];
    [webView release];

    NSString * urlString = @"http://apple.com";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    //Add buttons for forward and back web navigation
    CGRect backButtonFrame = CGRectMake(8, 385, 65, 30);
    backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backButton setFrame:backButtonFrame];
    [backButton setEnabled:NO];
    [backButton setTitle:@"Back" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(goBackAction)forControlEvents:UIControlEventTouchUpInside ];
    [self.view addSubview:backButton];
    
    CGRect forwardButtonFrame = CGRectMake(250, 385, 65, 30);
    forwardButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [forwardButton setFrame:forwardButtonFrame];
    [forwardButton setEnabled:NO];
    [forwardButton setTitle:@"Forward" forState:UIControlStateNormal];
    [forwardButton addTarget:self action:@selector(forwardAction)forControlEvents:UIControlEventTouchUpInside ];
    [self.view addSubview:forwardButton];
    
}

- (void)goBackAction
{
    [webView goBack];
}

- (void)forwardAction
{
    [webView goForward];
}

#pragma mark webView delegate

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //test the state of [webView canGoForward] and canGoBack
    //and set [button setEnabled:NO];   YES or NO accordingly.
    //The button action methods should call goBack or goForward.
    
    [forwardButton setEnabled:[self.webView canGoForward]];
    [forwardButton setHighlighted:[self.webView canGoForward]];
    
    [backButton setEnabled:[self.webView canGoBack]];
    [backButton setHighlighted:[self.webView canGoBack]];
	
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
