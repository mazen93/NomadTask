//
//  ProductsListController.swift
//  AssessmentApp
//
//  Created by host on 21/11/2022.
//

import UIKit

class ProductsListController: UIViewController {

    fileprivate var dataCame = false
    @IBOutlet weak var collectionView:UICollectionView!
    
    var viewModel = ProductListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        registerCell()
        viewModel.getProducts()
        
        
    }
    private func setupView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical //.horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        collectionView.setCollectionViewLayout(layout, animated: true)
        viewModel.delegate = self
    }
    
    private func registerCell(){
        collectionView.register(UINib(nibName: ProductsCell.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: ProductsCell.cellIdentifier)
    }
    


}

extension ProductsListController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
      
        
        return UIHelpers.emptyCollectionView(collectionView: collectionView, dataCount: viewModel.productsList.count, dataCome: dataCame, emptyMessage: "No Products available")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsCell.cellIdentifier, for: indexPath) as! ProductsCell
        cell.configCell(model: viewModel.productsList[indexPath.row])
        cell.addToCartClosure = {
            
        }
        return cell
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)//here your custom value for spacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
        
        return CGSize(width:widthPerItem, height:180)
    }


   
    
    
}
extension ProductsListController:ViewModelDelegate{
    func didLoadWithFail(error: String) {
        print("error")
        
      
       
    }
    
    func didLoadWithSuccess() {
        print("succes")
        DispatchQueue.main.async {
            self.dataCame = true
            self.collectionView.reloadData()
        }
    }
    
    
}
