#import "OFPushWithReplaceLastSegue.h"

@implementation OFPushWithReplaceLastSegue

- (void)perform {
  NSMutableArray *navigationStack = [self.sourceViewController.navigationController.viewControllers mutableCopy];
  [navigationStack removeLastObject];
  [navigationStack addObject:self.destinationViewController];
  [self.sourceViewController.navigationController setViewControllers:navigationStack animated:true];
}

@end
