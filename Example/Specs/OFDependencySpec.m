@import Quick;
@import Nimble;
@import OrangeFramework;

@protocol TestProtocol <NSObject> @end
@interface TestClass : NSObject<TestProtocol> @end
@implementation TestClass @end

QuickSpecBegin(OFDependencySpec)

describe(@"dependency", ^{
  
  describe(@"by key", ^{
    NSString *dependencyKey = @"some_key";
    context(@"when registered", ^{
      context(@"with transient lifetime", ^{
        beforeEach(^{
          [OFDependency registerWithKey:dependencyKey lifetime:OFDependencyLifetimeTransient constructor:^id _Nonnull{
            return [NSObject new];
          }];
        });
        it(@"is available", ^{
          expect(@([OFDependency availableForKey:dependencyKey])).to(beTrue());
        });
        it(@"resolve with new instance everytime", ^{
          id instance1 = [OFDependency resolveByKey:dependencyKey];
          id instance2 = [OFDependency resolveByKey:dependencyKey];
          expect(instance1).toNot(beIdenticalTo(instance2));
        });
      });
      context(@"with singleton lifetime", ^{
        beforeEach(^{
          [OFDependency registerWithKey:dependencyKey lifetime:OFDependencyLifetimeSingleton constructor:^id _Nonnull{
            return [NSObject new];
          }];
        });
        it(@"is available", ^{
          expect(@([OFDependency availableForKey:dependencyKey])).to(beTrue());
        });
        it(@"resolve with single instance everytime", ^{
          __weak id instance1 = [OFDependency resolveByKey:dependencyKey];
          id instance2 = [OFDependency resolveByKey:dependencyKey];
          expect(instance1).to(beIdenticalTo(instance2));
        });
      });
      context(@"with weak singleton lifetime", ^{
        beforeEach(^{
          [OFDependency registerWithKey:dependencyKey lifetime:OFDependencyLifetimeWeakSingleton constructor:^id _Nonnull{
            return [NSObject new];
          }];
        });
        it(@"is available", ^{
          expect(@([OFDependency availableForKey:dependencyKey])).to(beTrue());
        });
        it(@"resolve with last instance if it's not deallocated", ^{
          id instance1 = [OFDependency resolveByKey:dependencyKey];
          id instance2 = [OFDependency resolveByKey:dependencyKey];
          expect(instance1).to(beIdenticalTo(instance2));
        });
        it(@"resolve with new instance if last instance is deallocated", ^{
          __block __weak id instance1;
          __block id instance2;
          dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            instance1 = [OFDependency resolveByKey:dependencyKey];
            instance2 = [OFDependency resolveByKey:dependencyKey];
          });
          expect(instance2).toNotEventually(beIdenticalTo(instance1));
        });
      });
    });
    context(@"when removed", ^{
      beforeEach(^{
        [OFDependency registerWithKey:dependencyKey lifetime:OFDependencyLifetimeTransient constructor:^id _Nonnull{
          return [NSObject new];
        }];
        [OFDependency removeForKey:dependencyKey];
      });
      it(@"is not available", ^{
        expect(@([OFDependency availableForKey:dependencyKey])).to(beFalse());
      });
      it(@"resolve with exception", ^{
        expect([OFDependency resolveByKey:dependencyKey]).to(raiseException());
      });
    });
  });
  
  describe(@"by class", ^{
    context(@"when constructor result is kind of registered class", ^{
      it(@"resolve", ^{
        [OFDependency registerWithClass:[TestClass class] lifetime:OFDependencyLifetimeTransient constructor:^id _Nonnull{
          return [TestClass new];
        }];
        expect([OFDependency resolveByClass:[TestClass class]]).to(beAKindOf([TestClass class]));
      });
    });
    context(@"when constructor result is NOT kind of registered class", ^{
      it(@"resolve with exception", ^{
        [OFDependency registerWithClass:[TestClass class] lifetime:OFDependencyLifetimeTransient constructor:^id _Nonnull{
          return [NSString new];
        }];
        expect([OFDependency resolveByClass:[TestClass class]]).to(raiseException());
      });
    });
  });
  
  describe(@"by protocol", ^{
    context(@"when constructor result class conformed to registered protocol", ^{
      it(@"resolve", ^{
        [OFDependency registerWithProtocol:@protocol(TestProtocol) lifetime:OFDependencyLifetimeTransient constructor:^id _Nonnull{
          return [TestClass new];
        }];
        expect(@([[OFDependency resolveByProtocol:@protocol(TestProtocol)] conformsToProtocol:@protocol(TestProtocol)])).to(beTrue());
      });
    });
    context(@"when constructor result class NOT conformed to registered protocol", ^{
      it(@"resolve with exception", ^{
        [OFDependency registerWithProtocol:@protocol(TestProtocol) lifetime:OFDependencyLifetimeTransient constructor:^id _Nonnull{
          return [NSString new];
        }];
        expect([OFDependency resolveByProtocol:@protocol(TestProtocol)]).to(raiseException());
      });
    });
  });

});

QuickSpecEnd
