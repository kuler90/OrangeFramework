#import <UIKit/UIKit.h>

@interface UIView (OFExtension)

@property (nonatomic) IBInspectable CGFloat OF_cornerRadius; // for storyboard
@property (nonatomic) IBInspectable CGFloat OF_borderWidth; // for storyboard
@property (nonatomic, nullable) IBInspectable UIColor *OF_borderColor; // for storyboard

@end
