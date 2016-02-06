#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBlockOperation (OFExtension)

typedef void (^OFAsyncBlockFinish)(void);

+ (instancetype)of_blockOperationWithAsyncBlock:(void (^)(OFAsyncBlockFinish finish))asyncBlock NS_SWIFT_NAME(init(of_asyncBlock:));
- (void)of_addExecutionAsyncBlock:(void (^)(OFAsyncBlockFinish finish))asyncBlock;

@end

@interface NSOperationQueue (OFExtension)

- (void)of_addOperationWithAsyncBlock:(void (^)(OFAsyncBlockFinish finish))asyncBlock;

@end

NS_ASSUME_NONNULL_END