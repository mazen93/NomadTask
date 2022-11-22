//
//  Product.swift
//  AssessmentApp
//
//  Created by Irfan Saeed on 19/01/2022.
//

import Foundation

struct Product: Codable {
    let barcode, welcomeDescription, id: String?
    let imageURL: String?
    let name: String?
    let retailPrice: Double?
    let costPrice: Int?

       enum CodingKeys: String, CodingKey {
           case barcode
           case welcomeDescription = "description"
           case id
           case imageURL = "image_url"
           case name
           case retailPrice = "retail_price"
           case costPrice = "cost_price"
       }
}
typealias ProductsDic = [String: Product]
