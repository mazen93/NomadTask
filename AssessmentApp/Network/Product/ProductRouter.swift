//
//  ProductRoute.swift
//  AssessmentApp
//
//  Created by host on 22/11/2022.
//

import Foundation
import Alamofire
//api/
enum ProductRouter: APIConfiguration {
    
 
 
    
    
    case getProducts
    
    var path: String {
        switch self {
            
        case .getProducts:
            return "v3/4e23865c-b464-4259-83a3-061aaee400ba"
            
        }
        
    }
    var method: HTTPMethod {
        switch self {
 
        case .getProducts:
            return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        
        case .getProducts:
            return   nil
        }
    }
    var hasLoading: Bool {
        switch self {
        case .getProducts:
            return true
        default:
            return false
        }
    }
}
