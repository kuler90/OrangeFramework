#import <Foundation/Foundation.h>

#define OFLocalized(key) [[NSBundle mainBundle] localizedStringForKey:key value:@"" table:nil]
#define OFLocalizedWithFormat(format, ...) [NSString localizedStringWithFormat:OFLocalized(format),##__VA_ARGS__]
