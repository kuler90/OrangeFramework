#import "NSBlockOperation+OFExtension.h"

@implementation NSBlockOperation (OFExtension)

+ (instancetype)blockOperationWithAsyncBlock:(void (^)(OFAsyncBlockFinish _Nonnull))asyncBlock {
  NSBlockOperation *blockOperation = [NSBlockOperation new];
  [blockOperation addExecutionAsyncBlock:asyncBlock];
  return blockOperation;
}

- (void)addExecutionAsyncBlock:(void (^)(OFAsyncBlockFinish _Nonnull))asyncBlock {
  dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
  [self addExecutionBlock:^{
    asyncBlock(^{
      dispatch_semaphore_signal(semaphore);
    });
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
  }];
}

@end

@implementation NSOperationQueue (OFExtension)

- (void)addOperationWithAsyncBlock:(void (^)(OFAsyncBlockFinish _Nonnull))asyncBlock {
  [self addOperation:[NSBlockOperation blockOperationWithAsyncBlock:asyncBlock]];
}

@end
