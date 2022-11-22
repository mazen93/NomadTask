//
//  MainController.swift
//  AssessmentApp
//
//  Created by Irfan Saeed on 19/01/2022.
//

import UIKit

#warning("""
The initial viewcontroller should show the shopping basket.
It should contain a 'Plus' button for adding new items to the basket.
It should contain a 'Clear' button for removing all items in the basket.
""")




class MainController: UIViewController {

    
    @IBOutlet weak var removeAllButton: UIButton!
    @IBOutlet weak var totalView: UIView!
    var viewModel = CartViewModel()
   
  
   

    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var quantityLabel:UILabel!
    @IBOutlet weak var totalPriceLabel:UILabel!
    
   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        setupView()
        registerCell()
        setupData()
      
       
       
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.getProducts()
        setupData()
    }
 
    @IBAction func clearButtonAction(_ sender: Any) {
        
        CoreDataManager.removeAllFromCart(products: viewModel.productsList)
        self.viewModel.productsList.removeAll()
        tableView.reloadData()
        
        setupData()
    }
    @IBAction func addProductsAction(_ sender: Any) {
    
        
    }
    
    private func registerCell(){
        tableView.register(UINib(nibName: CartCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: CartCell.cellIdentifier)
        viewModel.getProducts()
    }
    
    private func setupView(){
        viewModel.delegate=self
    }
    func setupData() {
        if viewModel.productsList.count > 0 {
            totalView.isHidden = false
            
            quantityLabel.text = "\(CoreDataManager.getProductCounts())"
            totalPriceLabel.text = CoreDataManager.getTotalPrice().clean
            
        }else{
            totalView.isHidden = true
            
        }
        
    }
    
    
    
}

extension MainController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return  UIHelpers.emptyTableView(tableView: tableView, dataCount: viewModel.productsList.count, dataCome: true, emptyMessage: "No Products available")

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartCell.cellIdentifier, for: indexPath) as!  CartCell
        cell.configCell(model: viewModel.productsList[indexPath.row])
        cell.plusClosure = {
          
            let product = self.viewModel.productsList[indexPath.row]
            CoreDataManager.increaseQuantity(for: product)
            cell.quantity += 1
            self.setupData()
        }
        cell.minusClosure = {
            let product = self.viewModel.productsList[indexPath.row]
           
            if cell.quantity > 1 {
            CoreDataManager.decreaseQuantity(for: product)
            cell.quantity -= 1
            self.setupData()
            }
            
        }
        
        
        cell.deleteClosure = {
            let product = self.viewModel.productsList[indexPath.row]
            CoreDataManager.removeFromCart(product: product)
            
            tableView.beginUpdates()
            self.viewModel.productsList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            self.setupData()
            
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
}
extension MainController:ViewModelDelegate{
    func didLoadWithFail(error: String) {
        print("error")
    }
    
    func didLoadWithSuccess() {
        print("success")
        tableView.reloadData()
    }
    
    
}
