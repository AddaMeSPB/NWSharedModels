import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

extension URLResponse {
    public func isResponseOK() -> Bool {
        if let httpResponse = self as? HTTPURLResponse {
            return (200...299).contains(httpResponse.statusCode)
        }
        return false
    }
}
