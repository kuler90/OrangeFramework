#import "OFModalOverAllSegue.h"

@implementation OFModalOverAllSegue

- (void)perform {
  UIViewController *topVC = [UIApplication sharedApplication].keyWindow.rootViewController;
  while (topVC) {
    topVC = topVC.presentedViewController;
  }
  [topVC presentViewController:self.destinationViewController animated:true completion:nil];
}

@end
