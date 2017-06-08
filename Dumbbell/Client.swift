import Foundation

internal enum Method: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case head = "HEAD"
    case options = "OPTIONS"
}

public struct Request<Value: Codable> {
    internal var method: Method
    internal var path: String
    internal var queryItems: [URLQueryItem]
    internal var body: Data?

    internal init(method: Method = .get, path: String, queryItems: [URLQueryItem] = [], body: Data? = nil) {
        self.method = method
        self.path = path
        self.queryItems = queryItems
        self.body = body
    }
}

func urlRequest<Value>(_ request: Request<Value>) -> URLRequest {
    var builder = URLComponents(string: "https://api.buddybuild.com/v1/\(request.path)")!
    builder.queryItems = request.queryItems

    var builtRequest = URLRequest(url: builder.url!)
    builtRequest.httpBody = request.body
    builtRequest.httpMethod = request.method.rawValue

    return builtRequest
}


public enum Result<T, E: Error> {
    case success(T)
    case failure(E)
}

final public class Client {

    public enum ClientError: Error {

    }

    public struct APIKey {
        let key: String

        init(_ key: String) {
            self.key = key
        }
    }

    private let credentials: APIKey

    init(_ credentials: APIKey) {
        self.credentials = credentials
    }

    public func execute<Value>(_ request: Request<Value>, completion: (Result<Value, ClientError>) -> Void) {

    }
}
