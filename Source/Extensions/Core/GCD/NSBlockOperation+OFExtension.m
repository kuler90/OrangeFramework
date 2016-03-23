#import "NSBlockOperation+OFExtension.h"

@implementation NSBlockOperation (OFExtension)

+ (instancetype)of_blockOperationWithAsyncBlock:(void (^)(OFAsyncBlockFinish _Nonnull))asyncBlock {
  NSBlockOperation *blockOperation = [NSBlockOperation new];
  [blockOperation of_addExecutionAsyncBlock:asyncBlock];
  return blockOperation;
}

- (void)of_addExecutionAsyncBlock:(void (^)(OFAsyncBlockFinish _Nonnull))asyncBlock {
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

- (void)of_addOperationWithAsyncBlock:(void (^)(OFAsyncBlockFinish _Nonnull))asyncBlock {
  [self addOperation:[NSBlockOperation of_blockOperationWithAsyncBlock:asyncBlock]];
}

@end
