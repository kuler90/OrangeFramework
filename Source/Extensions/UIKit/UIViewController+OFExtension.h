#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (OFExtension)

- (IBAction)popAction:(id)sender;
- (IBAction)dismissAction:(id)sender;

- (nullable UIViewController *)topViewController;

@end

NS_ASSUME_NONNULL_END