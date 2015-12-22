#import "OFReplaceWithFadeSegue.h"

@implementation OFReplaceWithFadeSegue

- (void)perform {
  UIWindow *window = self.sourceViewController.view.window;
  CATransition *transition = [CATransition new];
  transition.duration = 0.3;
  transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  transition.type = kCATransitionFade;
  transition.fillMode = kCAFillModeForwards;
  [window.layer addAnimation:transition forKey:nil];
  window.rootViewController = self.destinationViewController;
}

@end
