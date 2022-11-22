//
//  ProductClient.swift
//  AssessmentApp
//
//  Created by host on 22/11/2022.
//

import Foundation
import Alamofire
import PromisedFuture

class ProductClient: APIClient {
   
    class func getProducts() -> Future<ProductsDic, AFError> {
        performRequest(route: ProductRouter.getProducts)
    }
        
}
//struct GenericResponse<T: Codable>: Codable {
//    let isSuccess: Bool?
//    var String: Product?
//    let message, innerMessage: String?
//    let errors: [String]?
//    let status: Int?
//}
