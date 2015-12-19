#import "NSString+OFExtension.h"

@implementation NSString (OFExtension)

- (BOOL)matchRegex:(NSString *)pattern {
  return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern] evaluateWithObject:self];
}

- (NSString *)firstMatchOfRegex:(NSString *)pattern {
  NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:NULL];
  NSTextCheckingResult *match = [regex firstMatchInString:self options:0 range:NSMakeRange(0, self.length)];
  if (match == nil) {
    return nil;
  }
  return [self substringWithRange:match.range];
}

- (NSArray<NSString *> *)allMatchesOfRegex:(NSString *)pattern {
  NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:NULL];
  NSArray *matches = [regex matchesInString:self options:0 range:NSMakeRange(0, self.length)];
  if (matches == nil) {
    return @[];
  }
  NSMutableArray *substrings = [[NSMutableArray alloc] initWithCapacity:matches.count];
  for (NSTextCheckingResult *match in matches) {
    [substrings addObject:[self substringWithRange:match.range]];
  }
  return [substrings copy];
}

- (BOOL)matchEmailString {
  return [self matchRegex:@"^[_A-Za-z0-9-+]+(\\.[_A-Za-z0-9-+]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z‌​]{2,})$"];
}

- (BOOL)matchUrlString {
  return [NSURL URLWithString:self] != nil;
}

@end
