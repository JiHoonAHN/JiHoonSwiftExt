import Foundation

protocol RunInLockTypeProtocol {
    var lockingType: NSLocking { get }
    func runInLock(_ block: @escaping () -> Void)
    func runInLock<T>(_ block: @escaping () -> T) -> T
}

extension RunInLockTypeProtocol {
    func runInLock<T>(_ block: @escaping () -> T) -> T {
        lockingType.lock()
        defer {
            lockingType.unlock()
        }
        return block()
    }
    
    func runInLock(_ block: @escaping () -> Void) {
        lockingType.lock()
        defer {
            lockingType.unlock()
        }
        block()
    }
}

extension RunInLockTypeProtocol where Self: NSLocking {
    var lockingType: NSLocking { self }
}
