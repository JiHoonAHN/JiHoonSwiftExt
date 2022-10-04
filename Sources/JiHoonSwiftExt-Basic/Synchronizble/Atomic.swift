import Foundation

@propertyWrapper
public struct Atomic<T> {
    private let lock = UnfairLock()
    
    private var value: T
    
    public var wrappedValue: T {
        get {
            lock.lock()
            defer {
                lock.unlock()
            }
            return value
        }
        mutating set {
            lock.lock()
            defer {
                lock.unlock()
            }
            value = newValue
        }
    }
    
    public init(wrappedValue: T) {
        self.value = wrappedValue
    }
    
    mutating public func adjust(block: @escaping ( _ value: T) -> T) {
        lock.lock()
        defer {
            lock.unlock()
        }
        value = block(value)
    }
}

extension Atomic where T == Bool {
    mutating public func toggle() {
        adjust { !$0 }
    }
}
