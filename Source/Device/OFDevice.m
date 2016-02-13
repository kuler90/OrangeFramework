#import "OFDevice.h"
#import <sys/utsname.h>

@implementation OFDevice

#pragma mark - Screen

+ (CGFloat)screenScale {
  return [UIScreen mainScreen].scale;
}

+ (CGFloat)screenWidth {
  return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)screenHeight {
  return [UIScreen mainScreen].bounds.size.height;
}

+ (CGFloat)screenMaxLength {
  return MAX([self screenWidth], [self screenHeight]);
}

+ (CGFloat)screenMinLength {
  return MIN([self screenWidth], [self screenHeight]);
}

+ (CGFloat)screenPixelLength {
  return 1.0f / [self screenScale];
}

+ (CGFloat)heightForStatusBar {
  return 20.0f;
}

+ (CGFloat)heightForNavBarPortrate {
  return 44.0f;
}

+ (CGFloat)heightForNavBarLandscape {
  return ([self isIPad] || [self isScreen5Dot5inch]) ? 44.0f : 32.0f;
}

+ (CGFloat)heightForTabBar {
  return [self isIPad] ? 56.0f : 49.0f;
}

+ (BOOL)isScreen3Dot5inch {
  return [self screenMaxLength] == 480;
}

+ (BOOL)isScreen4inch {
  return [self screenMaxLength] == 568;
}

+ (BOOL)isScreen4Dot7inch {
  return [self screenMaxLength] == 667 && [self screenScale] < 2.9;
}

+ (BOOL)isScreen5Dot5inch {
  return ([self screenMaxLength] == 667 && [self screenScale] > 2.9) || [self screenMaxLength] == 736;
}

#pragma mark - Model

+ (BOOL)isIPhone {
  return [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone;
}

+ (BOOL)isIPad {
  return [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad;
}

+ (BOOL)isAppleTV {
  return [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomTV;
}

+ (NSString *)deviceModel {
  struct utsname systemInfo;
  uname(&systemInfo);
  NSString *deviceCode = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
  NSDictionary *allDevices = @{
  /* iPod 5 */          @"iPod5,1": @"iPod Touch 5",
  /* iPod 6 */          @"iPod7,1": @"iPod Touch 6",
  /* iPhone 4 */        @"iPhone3,1":  @"iPhone 4", @"iPhone3,2": @"iPhone 4", @"iPhone3,3": @"iPhone 4",
  /* iPhone 4S */       @"iPhone4,1": @"iPhone 4S",
  /* iPhone 5 */        @"iPhone5,1": @"iPhone 5", @"iPhone5,2": @"iPhone 5",
  /* iPhone 5C */       @"iPhone5,3": @"iPhone 5C", @"iPhone5,4": @"iPhone 5C",
  /* iPhone 5S */       @"iPhone6,1": @"iPhone 5S", @"iPhone6,2": @"iPhone 5S",
  /* iPhone 6 */        @"iPhone7,2": @"iPhone 6",
  /* iPhone 6 Plus */   @"iPhone7,1": @"iPhone 6 Plus",
  /* iPhone 6S */       @"iPhone8,1": @"iPhone 6S",
  /* iPhone 6S Plus */  @"iPhone8,2": @"iPhone 6S Plus",
  /* iPad 2 */          @"iPad2,1": @"iPad 2", @"iPad2,2": @"iPad 2", @"iPad2,3": @"iPad 2", @"iPad2,4": @"iPad 2",
  /* iPad 3 */          @"iPad3,1": @"iPad 3", @"iPad3,2": @"iPad 3", @"iPad3,3": @"iPad 3",
  /* iPad 4 */          @"iPad3,4": @"iPad 4", @"iPad3,5": @"iPad 4", @"iPad3,6": @"iPad 4",
  /* iPad Air */        @"iPad4,1": @"iPad Air", @"iPad4,2": @"iPad Air", @"iPad4,3": @"iPad Air",
  /* iPad Air 2 */      @"iPad5,3": @"iPad Air 2", @"iPad5,4": @"iPad Air 2",
  /* iPad Mini */       @"iPad2,5": @"iPad Mini", @"iPad2,6": @"iPad Mini", @"iPad2,7": @"iPad Mini",
  /* iPad Mini 2 */     @"iPad4,4": @"iPad Mini 2", @"iPad4,5": @"iPad Mini 2", @"iPad4,6": @"iPad Mini 2",
  /* iPad Mini 3 */     @"iPad4,7": @"iPad Mini 3", @"iPad4,8": @"iPad Mini 3", @"iPad4,9": @"iPad Mini 3",
  /* iPad Mini 4 */     @"iPad5,1": @"iPad Mini 4", @"iPad5,2": @"iPad Mini 4",
  /* iPad Pro */        @"iPad6,7": @"iPad Pro", @"iPad6,8": @"iPad Pro",
  /* Apple Watch */     @"Watch1,1": @"Apple Watch", @"Watch1,2": @"Apple Watch",
  /* AppleTV */         @"AppleTV5,3": @"AppleTV",
  /* Simulator */       @"x86_64": @"Simulator", @"i386": @"Simulator"
  };
  return allDevices[deviceCode] ?: [UIDevice currentDevice].model;
}

#pragma mark - System

+ (NSString *)pathToDocuments {
  return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
}

+ (NSString *)pathToCaches {
  return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
}

+ (int)systemVersionInt {
  return [UIDevice currentDevice].systemVersion.intValue;
}

+ (BOOL)systemVersionEqualTo:(NSString *)version {
  return [[UIDevice currentDevice].systemVersion compare:version options:NSNumericSearch] == NSOrderedSame;
}

+ (BOOL)systemVersionLessThan:(NSString *)version {
  return [[UIDevice currentDevice].systemVersion compare:version options:NSNumericSearch] == NSOrderedAscending;
}

+ (BOOL)systemVersionGreaterThan:(NSString *)version {
  return [[UIDevice currentDevice].systemVersion compare:version options:NSNumericSearch] == NSOrderedDescending;
}

@end