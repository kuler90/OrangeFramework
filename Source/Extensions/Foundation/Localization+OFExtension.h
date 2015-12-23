#import <Foundation/Foundation.h>

#define OFLocalized(key) [[NSBundle mainBundle] localizedStringForKey:key value:@"" table:nil] // localized string from .strings files
#define OFLocalizedWithFormat(formatKey, ...) [NSString localizedStringWithFormat:OFLocalized(formatKey),##__VA_ARGS__] // localized string from .stringdict files
