#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (OFExtension)

- (IBAction)of_popAction:(id)sender; // for storyboard
- (IBAction)of_dismissAction:(id)sender; // for storyboard

- (nullable UIViewController *)of_topViewController;

@end

NS_ASSUME_NONNULL_END