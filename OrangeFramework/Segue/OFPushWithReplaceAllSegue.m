#import "OFPushWithReplaceAllSegue.h"

@implementation OFPushWithReplaceAllSegue

- (void)perform {
  [self.sourceViewController.navigationController setViewControllers:@[self.destinationViewController] animated:true];
}

@end
