//
//  APIConfiguration.swift
//  AbsherInterior
//
//  Created by Elsayed Hussein on 9/19/21.
//

import Alamofire
typealias HTTPMethod = Alamofire.HTTPMethod
typealias Parameters = Alamofire.Parameters

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var hasLoading: Bool { get }
    var baseURL: String {get}
}
extension APIConfiguration {
    var method: HTTPMethod { .get }
    var parameters: Parameters? { nil }
    var hasLoading: Bool { false }
    var baseURL: String {
        return Urls.baseURL
    }
    
    func asURLRequest() throws -> URLRequest {
        

        
        //        let url = try K.ProductionServer.baseURL.asURL()
        if let parameters = parameters {
            print("🧵 Parameters", parameters)
        } else {
            print("🧵 Parameters nil")
        }
//        var urlComponent = URLComponents(string: K.apiBaseURL + path)
        var urlComponent = URLComponents(string: baseURL + path)

        if method == .get  || method == .delete  {
            print("method is get here ")
            urlComponent?.queryItems = [URLQueryItem]()
            print("method is get here parameters \(parameters)")
            for parameter in parameters ?? [:] {
                
                var value = "\(parameter.value)"
                if let multiSet = parameter.value as? Set<Int> {
                    value = multiSet.map({"\($0)"}).joined(separator: ",")
                }
                urlComponent?.queryItems?.append(URLQueryItem(name: parameter.key, value: value))
            }
        }
        guard let url = urlComponent?.url else {
            throw AFError.invalidURL(url: URL(string: path)!)
        }
        print(" all url = \(url)" )
        
        
  
   
        
       
        
        var urlRequest = URLRequest(url: url)
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        
     
      
    
        // Parameters
        if method != .get || method == .delete {
            if let parameters = parameters {
                do {
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                } catch {
                    throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
                }
            }
        }
        return urlRequest
    }
}
