//
//  ReadTextViewController.h
//  navDemo
//
//  Created by ssarber on 10/27/12.
//
//
#import "TextViewController.h"
@interface ReadTextViewController : UIViewController <UITextViewDelegate, UIAlertViewDelegate>
{
	UITextView *textView;
}

@property (nonatomic, retain) UITextView *textView;

- (NSString *)textArchivePath;
@end
