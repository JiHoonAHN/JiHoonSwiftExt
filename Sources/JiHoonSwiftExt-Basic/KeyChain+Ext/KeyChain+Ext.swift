#if canImport(Security)
import Foundation
import Security

public final class KeyChain {
    static let shared = KeyChain()
    private init() {}
    
    public func save(_ service: String, account : String, value : String) {
        let keyChainQuery : NSDictionary = [
            kSecClass : kSecClassGenericPassword,
            kSecAttrService : service,
            kSecAttrAccount : account,
            kSecValueData : value.data(using: .utf8,allowLossyConversion: false)!
        ]
        SecItemDelete(keyChainQuery)
        let status: OSStatus = SecItemAdd(keyChainQuery, nil)
        assert(status == noErr, "토큰 값 저장에 실패했습니다.")
    }
    
    public func read(_ service : String, account : String) -> String? {
        let keyChainQuery :NSDictionary = [
            kSecClass : kSecClassGenericPassword,
            kSecAttrService : service,
            kSecAttrAccount : account,
            kSecReturnData : kCFBooleanTrue!,
            kSecMatchLimit : kSecMatchLimitOne
        ]
        var dataTypeRef : AnyObject?
        let status = SecItemCopyMatching(keyChainQuery, &dataTypeRef)
        
        if (status == errSecSuccess) {
            let retrievedData = dataTypeRef as! Data
            let value = String(data: retrievedData, encoding: .utf8)
            return value
        } else {
            Log.error("Nothing was retrieved from the keychain", status)
            return nil
        }
    }
    
    public func delete(_ service : String, account : String) {
        let keyChainQuery : NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount : account
        ]
        let status = SecItemDelete(keyChainQuery)
        assert(status == noErr , "토큰값 삭제에 실패했습니다.")
    }
}
#endif
