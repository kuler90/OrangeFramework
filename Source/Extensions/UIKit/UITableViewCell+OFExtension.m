#import "UITableViewCell+OFExtension.h"
#import "Geometry+OFExtension.h"

@implementation UITableViewCell (OFExtension)

- (CGFloat)of_SeparatorL {
  return self.separatorInset.left;
}

- (void)setOf_SeparatorL:(CGFloat)separatorL {
  self.separatorInset = OFEdgeInsetsModify(self.separatorInset, ^(UIEdgeInsets * _Nonnull insets) {
    insets->left = separatorL;
  });
  self.layoutMargins = OFEdgeInsetsModify(self.layoutMargins, ^(UIEdgeInsets * _Nonnull insets) {
    insets->left = MIN(separatorL, insets->left);
  });
}

- (CGFloat)of_SeparatorR {
  return self.separatorInset.right;
}

- (void)setOf_SeparatorR:(CGFloat)separatorR {
  self.separatorInset = OFEdgeInsetsModify(self.separatorInset, ^(UIEdgeInsets * _Nonnull insets) {
    insets->right = separatorR;
  });
  self.layoutMargins = OFEdgeInsetsModify(self.layoutMargins, ^(UIEdgeInsets * _Nonnull insets) {
    insets->right = MIN(separatorR, insets->right);
  });
}

@end
