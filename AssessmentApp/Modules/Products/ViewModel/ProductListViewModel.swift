//
//  ProductListViewModel.swift
//  AssessmentApp
//
//  Created by host on 22/11/2022.
//

import Foundation




class ProductListViewModel: ViewModel{
    //MARK:- Variable:-
    weak var delegate: ViewModelDelegate?
    var productsList:[Product] = []
    var productBuilder: ProductBuilder?
    var product: Product?
    func getProducts() {
        
        ProductClient.getProducts().execute {[weak self] response in
            
          if !response.isEmpty {
                
                self?.state = .normal
                for i in response.values {
                    self?.productsList.append(i)
                }
            
            }else{
                self?.state = .empty
            }
            self?.delegate?.didLoadWithSuccess()

        }onFailure: { [weak self] error in
            self?.delegate?.didLoadWithFail(error: error.localizedDescription)
            self?.state = .error(error)
        }
    }
    
    
    func setA(){
        guard let product = product else { return }
        if productBuilder == nil {
        productBuilder = ProductBuilder(product: product)
        }
    }
    
    
    
}



