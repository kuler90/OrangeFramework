#import "UIViewController+OFExtension.h"

@implementation UIViewController (OFExtension)

- (IBAction)of_popAction:(id)sender {
  [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)of_dismissAction:(id)sender {
  [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

+ (UIViewController *)of_topViewController {
  UIViewController *topVC = [UIApplication sharedApplication].keyWindow.rootViewController;
  while (topVC.presentedViewController) {
    topVC = topVC.presentedViewController;
  }
  return topVC;
}

@end