#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OFHelper : NSObject

#pragma mark - UI Info

+ (CGFloat)getScreenScale;
+ (CGFloat)getScreenWidth;
+ (CGFloat)getScreenHeight;
+ (CGFloat)getScreenMaxLength;
+ (CGFloat)getScreenMinLength;
+ (CGFloat)getScreenPixelLength;

+ (CGFloat)getHeightForStatusBar;
+ (CGFloat)getHeightForNavBarPortrate;
+ (CGFloat)getHeightForNavBarLandscape;
+ (CGFloat)getHeightForTabBar;

#pragma mark - Device Info

+ (BOOL)isIPhone;

+ (BOOL)isIPhone_35Inch;
+ (BOOL)isIPhone_4Inch;
+ (BOOL)isIPhone_47Inch;
+ (BOOL)isIPhone_55Inch;

+ (BOOL)isIPad;

+ (BOOL)isAppleTV;

#pragma mark - System Info

+ (NSString *)getPathToDocuments;
+ (NSString *)getPathToCaches;

+ (BOOL)isSystemVersionEqualTo:(NSString *)version;
+ (BOOL)isSystemVersionLessThan:(NSString *)version;
+ (BOOL)isSystemVersionGreaterThan:(NSString *)version;

+ (BOOL)isIOS7;
+ (BOOL)isIOS8;
+ (BOOL)isIOS9;

#pragma mark - Random Generator

+ (BOOL)getRandomBool;
+ (double)getRandomDoubleBetween:(double)min :(double)max;
+ (int)getRandomIntBetween:(int)min :(int)max;

@end

NS_ASSUME_NONNULL_END