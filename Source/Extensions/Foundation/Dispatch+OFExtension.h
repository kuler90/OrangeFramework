#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NS_INLINE void of_dispatch_main(dispatch_block_t block) {
  dispatch_async(dispatch_get_main_queue(), block);
}

NS_INLINE void of_dispatch_background(dispatch_block_t block) {
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}

NS_INLINE void of_dispatch_main_after(NSTimeInterval interval, dispatch_block_t block) {
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(interval * NSEC_PER_SEC)), dispatch_get_main_queue(), block);
}

NS_INLINE void of_dispatch_background_after(NSTimeInterval interval, dispatch_block_t block) {
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(interval * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}

NS_ASSUME_NONNULL_END