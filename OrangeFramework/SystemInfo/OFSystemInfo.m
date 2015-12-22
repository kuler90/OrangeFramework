#import "OFSystemInfo.h"

@implementation _OFSystemInfo

+ (instancetype)sharedInfo {
  static _OFSystemInfo *instance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [self new];
  });
  return instance;
}

#pragma mark - UI

- (CGFloat)screenScale {
  return [UIScreen mainScreen].scale;
}

- (CGFloat)screenWidth {
  return [UIScreen mainScreen].bounds.size.width;
}

- (CGFloat)screenHeight {
  return [UIScreen mainScreen].bounds.size.height;
}

- (CGFloat)screenMaxLength {
  return MAX(self.screenWidth, self.screenHeight);
}

- (CGFloat)screenMinLength {
  return MIN(self.screenWidth, self.screenHeight);
}

- (CGFloat)screenPixelLength {
  return 1.0f / self.screenScale;
}

- (CGFloat)heightForStatusBar {
  return 20.0f;
}

- (CGFloat)heightForNavBarPortrate {
  return 44.0f;
}

- (CGFloat)heightForNavBarLandscape {
  return self.isIPad || self.isIPhone_55Inch ? 44.0f : 32.0f;
}

- (CGFloat)heightForTabBar {
  return self.isIPad ? 56.0f : 49.0f;
}

#pragma mark - Device

- (BOOL)isIPhone {
  return [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone;
}

- (BOOL)isIPhone_35Inch {
  return self.isIPhone && self.screenMaxLength < 568.0;
}

- (BOOL)isIPhone_4Inch {
  return self.isIPhone && self.screenMaxLength == 568.0;
}

- (BOOL)isIPhone_47Inch {
  return self.isIPhone && self.screenMaxLength == 667.0;
}

- (BOOL)isIPhone_55Inch {
  return self.isIPhone && self.screenMaxLength == 736.0;
}

- (BOOL)isIPad {
  return [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad;
}

- (BOOL)isAppleTV {
  return [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomTV;
}

#pragma mark - System

- (NSString *)pathToDocuments {
  return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
}

- (NSString *)pathToCaches {
  return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
}

- (BOOL)systemVersionEqualTo:(NSString *)version {
  return [[UIDevice currentDevice].systemVersion compare:version options:NSNumericSearch] == NSOrderedSame;
}

- (BOOL)systemVersionLessThan:(NSString *)version {
  return [[UIDevice currentDevice].systemVersion compare:version options:NSNumericSearch] == NSOrderedAscending;
}

- (BOOL)systemVersionGreaterThan:(NSString *)version {
  return [[UIDevice currentDevice].systemVersion compare:version options:NSNumericSearch] == NSOrderedDescending;
}

- (BOOL)isIOS7 {
  return [UIDevice currentDevice].systemVersion.integerValue == 7;
}

- (BOOL)isIOS8 {
  return [UIDevice currentDevice].systemVersion.integerValue == 8;
}

- (BOOL)isIOS9 {
  return [UIDevice currentDevice].systemVersion.integerValue == 9;
}

@end