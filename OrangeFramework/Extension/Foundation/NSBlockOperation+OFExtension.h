#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBlockOperation (OFExtension)

typedef void (^OFAsyncBlockFinish)(void);

+ (instancetype)blockOperationWithAsyncBlock:(void (^)(OFAsyncBlockFinish finish))asyncBlock;
- (void)addExecutionAsyncBlock:(void (^)(OFAsyncBlockFinish finish))asyncBlock;

@end

@interface NSOperationQueue (OFExtension)

- (void)addOperationWithAsyncBlock:(void (^)(OFAsyncBlockFinish finish))asyncBlock;

@end

NS_ASSUME_NONNULL_END