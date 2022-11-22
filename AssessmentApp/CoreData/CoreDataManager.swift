//
//  CoreDataManager.swift
//  AssessmentApp
//
//  Created by host on 22/11/2022.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager: NSObject {
    class func getContext () -> NSManagedObjectContext {
        return CoreDataStack.persistentContainer.viewContext
    }
    
    class func save() {
        do {
            try getContext().save()
        } catch {
            print("error when save")
        }
    }
    
    class func getProduct(id: String) -> ProductEntity? {
        let fetchRequest: NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = \(id)")
        
        do {
            return try getContext().fetch(fetchRequest).first
        } catch {
            print("Error with request: \(error)")
        }
        
        return nil
    }

    class func insert(product: Product, quantity: Int,pId:String) {
        if let currnetProduct = getProduct(id: pId) {
            currnetProduct.quantity += Int64(quantity)
            save()
        } else {
            insertNewProduct(product: product,quantity: quantity)
        }
    }
    
    class func insertNewProduct(product: Product, quantity: Int) {
        let productEntity = ProductEntity(context: getContext())
        productEntity.id = product.id ?? ""
        productEntity.quantity = Int64(quantity)
        productEntity.name = product.name
        productEntity.image = product.imageURL
        productEntity.price = product.retailPrice ?? 0
      
        
        
        save()
    }
    
    class func increaseQuantity(for product: ProductEntity) {
        print("old product.quantity \(product.quantity)")
        product.quantity += 1
        print("new product.quantity \(product.quantity)")
        save()
    }
    
    class func decreaseQuantity(for product: ProductEntity) {
        
        product.quantity -= 1
        save()
    }
    
    class func removeFromCart(product: ProductEntity) {
        getContext().delete(product)
        save()
    }
    class func removeAllFromCart(products: [ProductEntity]) {
        for i in products {
            getContext().delete(i)
            save()
        }
       
    }
    
    class func getProducts() -> [ProductEntity] {
        let fetchRequest: NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
        
        do {
            return try getContext().fetch(fetchRequest)
        } catch {
            print("Error with request: \(error)")
        }
        
        return []
    }
    
    class func getProductCounts() -> Int {
        return getProducts().count
    }
    
    class func getTotalPrice() -> Double {
        let products = getProducts()
        
        var totalPrice = 0.0
        
        products.forEach {
            totalPrice += ($0.price * Double($0.quantity))
        }
        
        return totalPrice
    }

    
    
    
    class func emptyCart() {

        let meals = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductEntity")
        let emptyProductsReq = NSBatchDeleteRequest(fetchRequest: meals)

        do {
            try getContext().execute(emptyProductsReq)
        } catch {
            print("Error with request: \(error)")
        }
    }
}
