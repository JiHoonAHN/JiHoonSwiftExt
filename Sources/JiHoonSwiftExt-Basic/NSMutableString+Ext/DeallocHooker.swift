import Foundation

final class DeallocHooker {
    
    typealias Handler = () -> Void
    
    private struct AssociatedKey {
        static var dealocHooker = "deallocHooker"
    }
    private let hander: Handler
    
    private init(_ hander: @escaping Handler) {
        self.hander = hander
    }
    
    deinit { hander() }
    
    static func install(to object: AnyObject, _ handler: @escaping Handler) {
        objc_setAssociatedObject(
            object,
            &AssociatedKey.dealocHooker,
            DeallocHooker(handler),
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
    }
}
