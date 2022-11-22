//
//  CartViewModel.swift
//  AssessmentApp
//
//  Created by host on 22/11/2022.
//

import Foundation
/*
class CartViewModel{
    
    var product: Product?
    var productBuilder: ProductBuilder?
    func increaseQuantity() {
        guard let product = product else { return }
        
        if productBuilder == nil {
            productBuilder = ProductBuilder(product: product)
        }
        
        productBuilder?.quantity += 1
    }
    
    func decreaseQuantity() {
        guard let product = product else { return }
        
        if productBuilder == nil {
            productBuilder = ProductBuilder(product: product)
        }
        
        productBuilder?.quantity -= 1
    }
    
    func getQuantity() -> Int {
        return productBuilder?.quantity ?? 1
    }
    
    
    
    
    
    
}
 
 */



class CartViewModel:ViewModel{
    //MARK:- Variable:-
  
    var productsList:[ProductEntity] = []
    weak var delegate:ViewModelDelegate?
    
    
    func getProducts() {
        productsList = CoreDataManager.getProducts()
        delegate?.didLoadWithSuccess()
    }
}

