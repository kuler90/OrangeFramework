#import "UITableViewCell+OFExtension.h"
#import "Geometry+OFExtension.h"

@implementation UITableViewCell (OFExtension)

- (CGFloat)separatorL {
  return self.separatorInset.left;
}

- (void)setSeparatorL:(CGFloat)separatorL {
  self.separatorInset = UIEdgeInsetsModify(self.separatorInset, ^(UIEdgeInsets * _Nonnull insets) {
    insets->left = separatorL;
  });
  self.layoutMargins = UIEdgeInsetsModify(self.layoutMargins, ^(UIEdgeInsets * _Nonnull insets) {
    insets->left = MIN(separatorL, insets->left);
  });
}

- (CGFloat)separatorR {
  return self.separatorInset.right;
}

- (void)setSeparatorR:(CGFloat)separatorR {
  self.separatorInset = UIEdgeInsetsModify(self.separatorInset, ^(UIEdgeInsets * _Nonnull insets) {
    insets->right = separatorR;
  });
  self.layoutMargins = UIEdgeInsetsModify(self.layoutMargins, ^(UIEdgeInsets * _Nonnull insets) {
    insets->right = MIN(separatorR, insets->right);
  });
}

@end
