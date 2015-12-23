#import "UIViewController+OFExtension.h"

@implementation UIViewController (OFExtension)

- (IBAction)popAction:(id)sender {
  [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)dismissAction:(id)sender {
  [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (UIViewController *)topViewController {
  UIViewController *topVC = [UIApplication sharedApplication].keyWindow.rootViewController;
  while (topVC.presentedViewController) {
    topVC = topVC.presentedViewController;
  }
  return topVC;
}

@end