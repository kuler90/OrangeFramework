@import Quick;
@import Nimble;
@import OrangeFramework;

QuickSpecBegin(OFExtensionSpec)

describe(@"NSBlockOperation+AsyncBlock", ^{
  context(@"when use serial queue", ^{
    it(@"run async operation in series", ^{
      __block NSString  *testString = @"";
      NSOperationQueue *testOperationQueue = [[NSOperationQueue alloc]init];
      testOperationQueue.maxConcurrentOperationCount = 1;
      [testOperationQueue  addOperationWithAsyncBlock:^(OFAsyncBlockFinish  _Nonnull finish) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          testString = [testString stringByAppendingString:@"1"];
          finish();
        });
      }];
      [testOperationQueue  addOperationWithAsyncBlock:^(OFAsyncBlockFinish  _Nonnull finish) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          testString = [testString stringByAppendingString:@"2"];
          finish();
        });
      }];
      [testOperationQueue  addOperationWithAsyncBlock:^(OFAsyncBlockFinish  _Nonnull finish) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          testString = [testString stringByAppendingString:@"3"];
          finish();
        });
      }];
      expect(testString).toEventually(equal(@"123"));
    });
  });
  context(@"when use parallel queue", ^{
    it(@"run async operation in parallel", ^{
      __block NSString  *testString = @"";
      NSOperationQueue *testOperationQueue = [[NSOperationQueue alloc]init];
      testOperationQueue.maxConcurrentOperationCount = 3;
      [testOperationQueue  addOperationWithAsyncBlock:^(OFAsyncBlockFinish  _Nonnull finish) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          testString = [testString stringByAppendingString:@"1"];
          finish();
        });
      }];
      [testOperationQueue  addOperationWithAsyncBlock:^(OFAsyncBlockFinish  _Nonnull finish) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          testString = [testString stringByAppendingString:@"2"];
          finish();
        });
      }];
      [testOperationQueue  addOperationWithAsyncBlock:^(OFAsyncBlockFinish  _Nonnull finish) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          testString = [testString stringByAppendingString:@"3"];
          finish();
        });
      }];
      expect(testString).toEventually(equal(@"132"));
    });
  });
});

describe(@"NSString+Regex", ^{
  context(@"when the string contains regex pattern", ^{
    NSString *testString = @"This is test string.";
    it(@"match regex", ^{
      NSString *testRegex = @".*";
      expect(@([testString matchRegex:testRegex])).to(beTrue());
    });
    
    it(@"has first match of regex", ^{
      NSString *testRegex = @"is";
      expect([testString firstMatchOfRegex:testRegex]).toNot(beNil());
    });
    
    it(@"has all matches of regex", ^{
      NSString *testRegex = @"is";
      NSInteger resultCount = 2;
      expect(@([testString allMatchesOfRegex:testRegex].count)).to(equal(@(resultCount)));
    });
    
    it(@"has match email", ^{
      NSString *testEmail = @"test@mail.com";
      expect(@([testEmail matchEmailString])).to(beTrue());
    });
  });
  context(@"when the string NOT contains regex pattern", ^{
    NSString *testString = @"This is test string.";
    it(@"not match regex", ^{
      NSString *testRegex = @"This";
      expect(@([testString matchRegex:testRegex])).toNot(beTrue());
    });
    it(@"has not first match of regex", ^{
      NSString *testRegex = @"testing";
      expect([testString firstMatchOfRegex:testRegex]).to(beNil());
    });
    
    it(@"has not all matches of regex", ^{
      NSString *testRegex = @"testing";
      expect([testString firstMatchOfRegex:testRegex]).to(beNil());
    });
    
    it(@"has not match email", ^{
      NSString *testEmail = @"testmail.com";
      expect(@([testEmail matchEmailString])).toNot(beTrue());
    });
  });
});

describe(@"UIColor+HexString", ^{
  context(@"when valid hex string", ^{
    it(@"create color", ^{
      NSString *testStringColor = @"#e74c3c";
      CGFloat testR = 231/256.0f, testG = 76/256.0f, testB = 60/256.0f;
      UIColor *testColor = [UIColor colorWithHexString:testStringColor];
      CGFloat r, g, b;
      [testColor getRed:&r green:&g blue:&b alpha:NULL];
      expect(@(r)).to(equal(@(testR)));
      expect(@(g)).to(equal(@(testG)));
      expect(@(b)).to(equal(@(testB)));
    });
    context(@"when NOT valid hex string", ^{
      it(@"create NIL color", ^{
        NSString *testStringColor = @"888e74c3c";
        expect([UIColor colorWithHexString:testStringColor]).to(beNil());
      });
    });
    
  });
});

QuickSpecEnd

