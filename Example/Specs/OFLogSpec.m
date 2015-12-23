@import Quick;
@import Nimble;
@import OrangeFramework;

QuickSpecBegin(OFLogSpec)

describe(@"log", ^{
  
  __block NSString *logedString;
  OFLogger *testLogger = [[OFLogger alloc]initWithLogLevel:OFLogLevelAll printer:^(OFLogFlag flag, NSString * _Nonnull message) {
    logedString = message;
  } formatter:^NSString * _Nonnull(id  _Nullable object, OFLogFlag flag, NSString * _Nonnull function, NSString * _Nonnull file, unsigned int line) {
    return [object description];
  }];
  [OFLog registerLogger:testLogger];
  
  context(@"when log is printing", ^{
    
    it(@"is error", ^{
      OFLogError(@"error");
      expect(logedString).to(equal(@"error"));
    });
    
    it(@"is warning", ^{
      OFLogWarning(@"warning");
      expect(logedString).to(equal(@"warning"));
    });
    
    it(@"is info", ^{
      OFLogInfo(@"info");
      expect(logedString).to(equal(@"info"));
    });
    
    it(@"is debug", ^{
      OFLogDebug(@"debug");
      expect(logedString).to(equal(@"debug"));
    });
    
    it(@"is verbose", ^{
      OFLogVerbose(@"verbose");
      expect(logedString).to(equal(@"verbose"));
    });
    it(@"is error object", ^{
      NSNumber *testObject = [[NSNumber alloc] initWithInt:11];
      OFLogErrorObject(testObject);
      expect(logedString).to(equal(testObject.stringValue));
    });
    
    it(@"is warning object", ^{
      NSNumber *testObject = [[NSNumber alloc] initWithInt:100];
      OFLogWarningObject(testObject);
      expect(logedString).to(equal(testObject.stringValue));
    });
    
    it(@"is info object", ^{
      NSNumber *testObject = [[NSNumber alloc] initWithInt:101];
      OFLogInfoObject(testObject);
      expect(logedString).to(equal(testObject.stringValue));
    });
    
    it(@"is debug object", ^{
      NSNumber *testObject = [[NSNumber alloc] initWithInt:110];
      OFLogDebugObject(testObject);
      expect(logedString).to(equal(testObject.stringValue));
    });
    
    it(@"is verbose object", ^{
      NSNumber *testObject = [[NSNumber alloc] initWithInt:111];
      OFLogVerboseObject(testObject);
      expect(logedString).to(equal(testObject.stringValue));
    });
  });
});

QuickSpecEnd
