#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OFDevice : NSObject

#pragma mark - Screen

+ (CGFloat)screenScale;
+ (CGFloat)screenWidth;
+ (CGFloat)screenHeight;
+ (CGFloat)screenMaxLength;
+ (CGFloat)screenMinLength;
+ (CGFloat)screenPixelLength;

+ (CGFloat)heightForStatusBar;;
+ (CGFloat)heightForNavBarPortrate;
+ (CGFloat)heightForNavBarLandscape;
+ (CGFloat)heightForTabBar;

+ (BOOL)isScreen3Dot5inch;
+ (BOOL)isScreen4inch;;
+ (BOOL)isScreen4Dot7inch;
+ (BOOL)isScreen5Dot5inch;

#pragma mark - Model

+ (BOOL)isIPhone;
+ (BOOL)isIPad;
+ (BOOL)isAppleTV;

+ (NSString *)deviceModel;

#pragma mark - System

+ (NSString *)pathToDocuments;
+ (NSString *)pathToCaches;

+ (int)systemVersionInt; // major version
+ (BOOL)systemVersionEqualTo:(NSString *)version;
+ (BOOL)systemVersionLessThan:(NSString *)version;
+ (BOOL)systemVersionGreaterThan:(NSString *)version;

@end

NS_ASSUME_NONNULL_END