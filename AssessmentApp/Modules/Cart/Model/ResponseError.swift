//
//  ResponseError.swift
//  AssessmentApp
//
//  Created by host on 22/11/2022.
//

import Foundation
struct ResponseError: Codable {
    let field: String
    let error: String
    
    init(error: String) {
        self.field = ""
        self.error = error
    }
    
    init(field: String, error: String) {
        self.field = field
        self.error = error
    }
}
