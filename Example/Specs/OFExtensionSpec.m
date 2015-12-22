@import Quick;
@import Nimble;
@import OrangeFramework;

QuickSpecBegin(OFExtensionSpec)

describe(@"NSBlockOperation+AsyncBlock", ^{
  context(@"when several operations in queue", ^{
    it(@"is max concurent operation in queue equal one", ^{
      __block NSString  *testString = @"";
      NSOperationQueue *testOperationQueue = [[NSOperationQueue alloc]init];
      testOperationQueue.maxConcurrentOperationCount = 1;
      [testOperationQueue  addOperationWithAsyncBlock:^(OFAsyncBlockFinish  _Nonnull finish) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          testString = @"first operation";
          finish();
        });
      }];
      [testOperationQueue  addOperationWithAsyncBlock:^(OFAsyncBlockFinish  _Nonnull finish) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          testString = @"second operation";
          finish();
        });
      }];
      [testOperationQueue  addOperationWithAsyncBlock:^(OFAsyncBlockFinish  _Nonnull finish) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          testString = @"third operation";
          finish();
        });
      }];
      expect(testString).withTimeout(1.5).toEventually(equal(@"third operation"));
    });
    
    it(@"is max concurent operation in queue equal two", ^{
      __block NSString  *testString = @"";
      NSOperationQueue *testOperationQueue = [[NSOperationQueue alloc]init];
      testOperationQueue.maxConcurrentOperationCount = 2;
      [testOperationQueue  addOperationWithAsyncBlock:^(OFAsyncBlockFinish  _Nonnull finish) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          testString = @"first operation";
          finish();
        });
      }];
      [testOperationQueue  addOperationWithAsyncBlock:^(OFAsyncBlockFinish  _Nonnull finish) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          testString = @"second operation";
          finish();
        });
      }];
      [testOperationQueue  addOperationWithAsyncBlock:^(OFAsyncBlockFinish  _Nonnull finish) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          testString = @"third operation";
          finish();
        });
      }];
      expect(testString).withTimeout(1.5).toEventually(equal(@"second operation"));
    });
  });
});

describe(@"NSString+Regex", ^{
  context(@"when the string is checked for regex", ^{
    NSString *testString = @"This is test string.";
    it(@"is match regex", ^{
      NSString *testRegex = @".*";
      expect(@([testString matchRegex:testRegex])).to(beTrue());
    });
    
    it(@"is first match of regex", ^{
      NSString *testRegex = @"[t]";
      NSString *testResult = @"t";
      expect([testString firstMatchOfRegex:testRegex]).to(equal(testResult));
    });
    
    it(@"is all matches of regex", ^{
      NSString *testRegex = @"[t]";
      NSString *testResult = @"ttt";
      expect([[testString allMatchesOfRegex:testRegex] componentsJoinedByString:@""]).to(equal(testResult));
    });
    
    it(@"is match email", ^{
      NSString *testEmail = @"test@gmail.com";
      expect(@([testEmail matchEmailString])).to(beTrue());
    });
  });
});

describe(@"UIColor+HexString", ^{
  context(@"when color setted by hex string", ^{
    
    it(@"is converting hex string to color", ^{
      //      alizarin color
      //      hex(#e74c3c)
      //      rgba(231, 76, 60,1.0)
      NSString *testStringColor = @"#e74c3c";
      CGFloat testR = 231/256.0f, testG = 76/256.0f,testB = 60/256.0f,testA = 1.0f;
      UIColor *testColor = [UIColor colorWithHexString:testStringColor alpha:1.0f];
      CGFloat r, g, b, a;
      [testColor getRed:&r green:&g blue:&b alpha:&a];
      expect(@(r)).to(equal(@(testR)));
      expect(@(g)).to(equal(@(testG)));
      expect(@(b)).to(equal(@(testB)));
      expect(@(a)).to(equal(@(testA)));
    });
  });
});

QuickSpecEnd
