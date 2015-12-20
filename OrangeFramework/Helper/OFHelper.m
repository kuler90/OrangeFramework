#import "OFHelper.h"

@implementation OFHelper

#pragma mark - UI Info

+ (CGFloat)getScreenScale {
  return [UIScreen mainScreen].scale;
}

+ (CGFloat)getScreenWidth {
  return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)getScreenHeight {
  return [UIScreen mainScreen].bounds.size.height;
}

+ (CGFloat)getScreenMaxLength {
  return MAX([self getScreenWidth], [self getScreenHeight]);
}

+ (CGFloat)getScreenMinLength {
  return MIN([self getScreenWidth], [self getScreenHeight]);
}

+ (CGFloat)getScreenPixelLength {
  return 1.0f / [self getScreenScale];
}

+ (CGFloat)getHeightForStatusBar {
  return 20.0f;
}

+ (CGFloat)getHeightForNavBarPortrate {
  return 44.0f;
}

+ (CGFloat)getHeightForNavBarLandscape {
  return [self isIPad] || [self isIPhone_55Inch] ? 44.0f : 32.0f;
}

+ (CGFloat)getHeightForTabBar {
  return self.isIPad ? 56.0f : 49.0f;
}

#pragma mark - Device Info

+ (BOOL)isIPhone {
  return [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone;
}

+ (BOOL)isIPhone_35Inch {
  return [self isIPhone] && [self getScreenMaxLength] < 568.0;
}

+ (BOOL)isIPhone_4Inch {
  return [self isIPhone] && [self getScreenMaxLength] == 568.0;
}

+ (BOOL)isIPhone_47Inch {
  return [self isIPhone] && [self getScreenMaxLength] == 667.0;
}

+ (BOOL)isIPhone_55Inch {
  return [self isIPhone] && [self getScreenMaxLength] == 736.0;
}

+ (BOOL)isIPad {
  return [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad;
}

+ (BOOL)isAppleTV {
  return [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomTV;
}


#pragma mark - System Info

+ (NSString *)getPathToDocuments {
  return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
}

+ (NSString *)getPathToCaches {
  return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
}

+ (BOOL)isSystemVersionEqualTo:(NSString *)version {
  return [[UIDevice currentDevice].systemVersion compare:version options:NSNumericSearch] == NSOrderedSame;
}

+ (BOOL)isSystemVersionLessThan:(NSString *)version {
  return [[UIDevice currentDevice].systemVersion compare:version options:NSNumericSearch] == NSOrderedAscending;
}

+ (BOOL)isSystemVersionGreaterThan:(NSString *)version {
  return [[UIDevice currentDevice].systemVersion compare:version options:NSNumericSearch] == NSOrderedDescending;
}

+ (BOOL)isIOS7 {
  return [UIDevice currentDevice].systemVersion.integerValue == 7;
}

+ (BOOL)isIOS8 {
  return [UIDevice currentDevice].systemVersion.integerValue == 8;
}

+ (BOOL)isIOS9 {
  return [UIDevice currentDevice].systemVersion.integerValue == 9;
}

#pragma mark - Random Generator

+ (BOOL)getRandomBool {
  return arc4random_uniform(2) == 0;
}

+ (double)getRandomDoubleBetween:(double)min :(double)max {
  return ((double)arc4random() / UINT32_MAX) * (max - min) + min;
}

+ (int)getRandomIntBetween:(int)min :(int)max {
  return arc4random_uniform(max - min + 1) + min;
}

@end