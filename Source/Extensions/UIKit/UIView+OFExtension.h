#import <UIKit/UIKit.h>

@interface UIView (OFExtension)

@property (nonatomic) IBInspectable CGFloat of_CornerRadius; // for storyboard
@property (nonatomic) IBInspectable CGFloat of_BorderWidth; // for storyboard
@property (nonatomic, nullable) IBInspectable UIColor *of_BorderColor; // for storyboard

@end
