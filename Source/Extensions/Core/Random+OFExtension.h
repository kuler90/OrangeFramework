#import <Foundation/Foundation.h>

NS_INLINE BOOL of_random_bool() {
  return arc4random_uniform(2) == 0;
}

NS_INLINE double of_random_double(double min, double max) {
  return ((double)arc4random() / UINT32_MAX) * (max - min) + min;
}

NS_INLINE int of_random_int(int min, int max) {
  return arc4random_uniform(max - min + 1) + min;
}