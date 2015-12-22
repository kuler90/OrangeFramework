#import <UIKit/UIKit.h>

#define OFSystemInfo [_OFSystemInfo sharedInfo]

NS_ASSUME_NONNULL_BEGIN

@interface _OFSystemInfo : NSObject

+ (instancetype)sharedInfo;

#pragma mark - UI

@property (readonly) CGFloat screenScale;
@property (readonly) CGFloat screenWidth;
@property (readonly) CGFloat screenHeight;
@property (readonly) CGFloat screenMaxLength;
@property (readonly) CGFloat screenMinLength;
@property (readonly) CGFloat screenPixelLength;

@property (readonly) CGFloat heightForStatusBar;;
@property (readonly) CGFloat heightForNavBarPortrate;
@property (readonly) CGFloat heightForNavBarLandscape;
@property (readonly) CGFloat heightForTabBar;

#pragma mark - Device

@property (readonly) BOOL isIPhone;;
@property (readonly) BOOL isIPhone_35Inch;
@property (readonly) BOOL isIPhone_4Inch;
@property (readonly) BOOL isIPhone_47Inch;
@property (readonly) BOOL isIPhone_55Inch;

@property (readonly) BOOL isIPad;
@property (readonly) BOOL isAppleTV;

#pragma mark - System

@property (readonly) NSString *pathToDocuments;
@property (readonly) NSString *pathToCaches;

@property (readonly) BOOL isIOS7;
@property (readonly) BOOL isIOS8;
@property (readonly) BOOL isIOS9;

- (BOOL)systemVersionEqualTo:(NSString *)version;
- (BOOL)systemVersionLessThan:(NSString *)version;
- (BOOL)systemVersionGreaterThan:(NSString *)version;

@end

NS_ASSUME_NONNULL_END