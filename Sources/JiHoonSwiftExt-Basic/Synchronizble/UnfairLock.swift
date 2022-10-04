import Foundation

final class UnfairLock {
    private let unfairLock: os_unfair_lock_t
    private let unfairValue: os_unfair_lock_s
    
    init() {
        self.unfairLock = .allocate(capacity: 1)
        self.unfairValue = .init()
        self.unfairLock.initialize(to: unfairValue)
    }
    
    deinit {
        unfairLock.deinitialize(count: 1)
        unfairLock.deallocate()
    }
}

extension UnfairLock: NSLocking {
    
    func lock() {
        os_unfair_lock_lock(unfairLock)
    }
    
    func tryLock() -> Bool {
        os_unfair_lock_trylock(unfairLock)
    }
    
    func unlock() {
        os_unfair_lock_unlock(unfairLock)
    }
}

extension UnfairLock: RunInLockTypeProtocol { }
