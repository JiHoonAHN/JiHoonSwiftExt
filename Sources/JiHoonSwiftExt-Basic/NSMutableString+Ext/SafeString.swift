import Foundation

extension NSMutableString {
    public func safeString() -> NSMutableString {
        let encoding = String.Encoding.utf8.rawValue
        
        let bufferSize = self.maximumLengthOfBytes(using: encoding) + 1
        let buffer = UnsafeMutablePointer<Int8>.allocate(capacity: bufferSize)
        self.getCString(buffer, maxLength: bufferSize - 1, encoding: encoding)
        
        let newString = NSMutableString(
            bytesNoCopy: buffer,
            length: strlen(buffer),
            encoding: encoding,
            freeWhenDone: false
        ) ?? NSMutableString()
        
        DeallocHooker.install(to: newString) {
            memset(buffer, 0, bufferSize)
            buffer.deallocate()
        }
        return newString
    }
}
