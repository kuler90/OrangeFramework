#import <Foundation/Foundation.h>

FOUNDATION_EXPORT void dispatch_main_async(dispatch_block_t block);
FOUNDATION_EXPORT void dispatch_background_async(dispatch_block_t block);
FOUNDATION_EXPORT void dispatch_after_interval(NSTimeInterval interval, dispatch_queue_t queue, dispatch_block_t block);
FOUNDATION_EXPORT void dispatch_main_after_interval(NSTimeInterval interval, dispatch_block_t block);
FOUNDATION_EXPORT void dispatch_background_after_interval(NSTimeInterval after, dispatch_block_t block);

NS_INLINE void OF_dispatch_main_async(dispatch_block_t block) {
  dispatch_async(dispatch_get_main_queue(), block);
}
#define dispatch_main_async OF_dispatch_main_async

NS_INLINE void OF_dispatch_background_async(dispatch_block_t block) {
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}
#define dispatch_background_async OF_dispatch_background_async

NS_INLINE void OF_dispatch_after_interval(NSTimeInterval interval, dispatch_queue_t queue, dispatch_block_t block) {
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(interval * NSEC_PER_SEC)), queue, block);
}
#define dispatch_after_interval OF_dispatch_after_interval

NS_INLINE void OF_dispatch_main_after_interval(NSTimeInterval interval, dispatch_block_t block) {
  OF_dispatch_after_interval(interval, dispatch_get_main_queue(), block);
}
#define dispatch_main_after_interval OF_dispatch_main_after_interval

NS_INLINE void OF_dispatch_background_after_interval(NSTimeInterval after, dispatch_block_t block) {
  OF_dispatch_after_interval(after, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}
#define dispatch_background_after_interval OF_dispatch_background_after_interval