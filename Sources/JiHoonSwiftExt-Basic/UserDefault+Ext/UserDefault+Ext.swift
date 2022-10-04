import Foundation

@propertyWrapper
public struct UserDefault<T> {
    private let key: String
    private let defaultValue: T
    private let standardUserDefault: UserDefaults
    
    public init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
        self.standardUserDefault = UserDefaults.standard
    }
    
    public var wrappedValue: T {
        get {
            return standardUserDefault.object(forKey: key) as? T ?? defaultValue
        }
        set {
            standardUserDefault.set(newValue, forKey: key)
        }
    }
}
