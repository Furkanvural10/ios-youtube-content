import Foundation


protocol NetworkManagerProtocol {
    
    func request<T: Codable>(_ endpoint: EndPoint, completion: @escaping (Result<T, NetworkError>) -> Void)
    
}

final class NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager()
    let session = URLSession.shared
    private let decoder = JSONDecoder()
    private init(){}
    
    
    func request<T: Codable>(_ endpoint: EndPoint, completion: @escaping (Result<T, NetworkError>) -> Void)  {
        
        let task = session.dataTask(with: endpoint.request()) { data, response, error in
            
            guard error == nil else {
                completion(.failure(.unableToCompleteError))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
     
            guard let data else {
                completion(.failure(.invalidData))
                return
            }

            switch response.statusCode {
            case 200...299:
                do {
                    let result = try self.decoder.decode(T.self, from: data)
                    completion(.success(result))
                } catch  {
                    completion(.failure(.decodingError))
                }
                
            case 401:
                completion(.failure(.authError))
            default:
                completion(.failure(.unknownError))
            }

        }
        task.resume()
    }
    
    
    
    
}
