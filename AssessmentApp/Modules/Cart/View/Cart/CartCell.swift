//
//  CartCell.swift
//  AssessmentApp
//
//  Created by host on 21/11/2022.
//

import UIKit

class CartCell: UITableViewCell {

    
    
    static let cellIdentifier = "CartCell"
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productCount: UILabel!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPhoto: UIImageView!
    
    
    var plusClosure: (() -> ())?
    var minusClosure: (() -> ())?
    var deleteClosure: (() -> ())?
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    @IBAction func plusButtonAction(_ sender: Any) {
        plusClosure?()
    }
    @IBAction func minusButtonAction(_ sender: Any) {
        minusClosure?()
    }
    @IBAction func deleteButtonAction(_ sender: Any) {
        deleteClosure?()
    }
 
     func configCell(model:Product){
         productPrice.text = "\(model.retailPrice ?? 0)"
         productTitle.text = model.name
         productPhoto.setImage(url: model.imageURL ?? "")
     }
    
}


