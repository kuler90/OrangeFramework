#import "OFModalOverAllWithFadeSegue.h"

@implementation OFModalOverAllWithFadeSegue

- (void)perform {
  self.destinationViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
  [super perform];
}

@end
