//
//  APIClient.swift
//  AbsherInterior
//
//  Created by Elsayed Hussein on 9/19/21.
//

import Alamofire
import PromisedFuture
import SVProgressHUD

class APIClient {
    @discardableResult
    static func performRequest<T: Codable>(route: APIConfiguration, decoder: JSONDecoder = JSONDecoder()) -> Future<T, AFError> {
        return Future(operation: { completion in
//            if route.hasLoading {
//                SVProgressHUD.show()
//            }
            
            
            
            
            print("route \(route)")
            AF.request(route).responseData(completionHandler: { (response) in
                
                
                
                #warning("check this please")

                print("route", route.urlRequest?.headers)
                
                
               
               
                print("🔗", route)
                if let v = response.data {
                    print("💽", String(data: v, encoding: .utf8)!)
//                    try! decoder.decode(T.self, from: v)
                }
            })
            .responseDecodable(decoder: decoder, completionHandler: { (response: DataResponse<T, AFError>) in
                if route.hasLoading {
                   // SVProgressHUD.dismiss()
                }
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    print("response.response?.statusCode \(response.response?.statusCode)")
                    if response.response?.statusCode == 401 {
                        print("response.response?.statusCode \(response.response?.statusCode)")
                    }else {
                    print("⚠️ ⚠️ Error", error.localizedDescription)
                    completion(.failure(error))
                    }
                }
            })
        })
    }
    


}

