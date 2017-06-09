import Foundation

internal enum Method: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case head = "HEAD"
    case options = "OPTIONS"
}

public struct Request<Value> {
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

public struct Apps {
    public static var list: Request<[App]> {
        return Request<[App]>(method: .get, path: "apps", queryItems: [], body: nil)
    }
}

func urlRequest<Value>(_ request: Request<Value>, credentials: Client.APIKey) -> URLRequest {
    var builder = URLComponents(string: "https://api.buddybuild.com/v1/\(request.path)")!
    builder.queryItems = request.queryItems

    var builtRequest = URLRequest(url: builder.url!)
    builtRequest.httpBody = request.body
    builtRequest.httpMethod = request.method.rawValue
    builtRequest.allHTTPHeaderFields = ["Authorization": "Bearer \(credentials.key)"]

    return builtRequest
}


public enum Result<T, E: Error> {
    case success(T)
    case failure(E)
}

final public class Client {

    public enum ClientError: Error {
        case networkError(Error)
        case requestError(Int)
        case parsingError(Error)
        case internalError
    }

    public struct APIKey {
        let key: String

        public init(_ key: String) {
            self.key = key
        }
    }

    private let credentials: APIKey
    private let session: URLSession

    public init(credentials: APIKey) {
        self.credentials = credentials
        self.session = .shared
    }

    public func execute<Value: Codable>(_ request: Request<Value>, completion: @escaping (Result<Value, ClientError>) -> Void) {
        let request = urlRequest(request, credentials: credentials)

        session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.networkError(error)))
            } else {
                let statusCode = (response as! HTTPURLResponse).statusCode
                if statusCode >= 400 && statusCode < 600 {
                    completion(.failure(.requestError(statusCode)))
                } else {
                    guard let data = data else {
                        return completion(.failure(.internalError))
                    }

                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(Formatter.date)

                    do {
                        let results: Value = try decoder.decode(Value.self, from: data)
                        completion(.success(results))
                    } catch let error {
                        completion(.failure(.parsingError(error)))
                    }
                }
            }
        }.resume()
    }
}
