//
//  ProductBuilder.swift
//  AssessmentApp
//
//  Created by host on 22/11/2022.
//

import Foundation
import CoreData
struct ProductBuilder {
    let product: Product
    var quantity = 1

    
    var errors: [ResponseError] = []
    
    mutating func saveProduct() -> Bool {
        errors = []
        
      
        
        guard errors.isEmpty else { return false }
        CoreDataManager.insert(product: product, quantity: quantity, pId: product.id!)
        return true
    }
}
