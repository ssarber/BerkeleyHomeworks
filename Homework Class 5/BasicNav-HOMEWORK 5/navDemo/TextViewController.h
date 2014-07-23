
#import <UIKit/UIKit.h>

@interface TextViewController : UIViewController <UITextViewDelegate, UIAlertViewDelegate>
{
	UITextView *textView;
}

@property (nonatomic, retain) UITextView *textView;
@property(nonatomic, retain) UIColor *textColor;

@end
