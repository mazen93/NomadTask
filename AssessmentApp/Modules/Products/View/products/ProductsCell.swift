//
//  ProductsCell.swift
//  AssessmentApp
//
//  Created by host on 21/11/2022.
//

import UIKit

class ProductsCell: UICollectionViewCell {
    static let cellIdentifier = "ProductsCell"
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPhoto: UIImageView!
    @IBOutlet weak var itemView: UIView!
    var addToCartClosure: (() -> ())?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        itemView.layer.borderColor =  UIColor.systemGray5.cgColor
        itemView.layer.borderWidth = 0.5
        itemView.layer.cornerRadius = 2
    }
    
   @IBAction func addToCartButtonAction(_ sender: UIButton) {
     addToCartClosure?()
    }
    func configCell(model:Product){
        productPrice.text = "\(model.retailPrice ?? 0)"
        productTitle.text = model.name
        productPhoto.setImage(url: model.imageURL ?? "")
    }

}
