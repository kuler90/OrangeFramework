import Foundation

public func dispatch_main_async(block: dispatch_block_t) {
  __OF_dispatch_main_async(block)
}

public func dispatch_background_async(block: dispatch_block_t) {
  __OF_dispatch_background_async(block)
}

public func dispatch_after_interval(interval: NSTimeInterval, _ queue: dispatch_queue_t, _ block: dispatch_block_t) {
  __OF_dispatch_after_interval(interval, queue, block)
}

public func dispatch_main_after_interval(interval: NSTimeInterval, _ block: dispatch_block_t) {
  __OF_dispatch_main_after_interval(interval, block)
}

public func dispatch_background_after_interval(interval: NSTimeInterval, _ block: dispatch_block_t) {
  __OF_dispatch_background_after_interval(interval, block)
}