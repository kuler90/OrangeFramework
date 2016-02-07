#import "UITableViewCell+OFExtension.h"
#import "Geometry+OFExtension.h"

@implementation UITableViewCell (OFExtension)

- (CGFloat)OF_separatorL {
  return self.separatorInset.left;
}

- (void)setOF_separatorL:(CGFloat)separatorL {
  self.separatorInset = OFEdgeInsetsModify(self.separatorInset, ^(UIEdgeInsets * _Nonnull insets) {
    insets->left = separatorL;
  });
  self.layoutMargins = OFEdgeInsetsModify(self.layoutMargins, ^(UIEdgeInsets * _Nonnull insets) {
    insets->left = MIN(separatorL, insets->left);
  });
}

- (CGFloat)OF_separatorR {
  return self.separatorInset.right;
}

- (void)setOF_separatorR:(CGFloat)separatorR {
  self.separatorInset = OFEdgeInsetsModify(self.separatorInset, ^(UIEdgeInsets * _Nonnull insets) {
    insets->right = separatorR;
  });
  self.layoutMargins = OFEdgeInsetsModify(self.layoutMargins, ^(UIEdgeInsets * _Nonnull insets) {
    insets->right = MIN(separatorR, insets->right);
  });
}

@end
