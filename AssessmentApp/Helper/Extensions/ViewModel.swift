//
//  ViewModel.swift
//  AssessmentApp
//
//  Created by host on 22/11/2022.
//
protocol ViewModelDelegate: AnyObject {
    func didLoadWithFail(error: String)
    func didLoadWithSuccess()
}
import Foundation
class ViewModel: NSObject {
    
    //MARK: - Properties
    var state: ViewModelState = .empty {
        didSet {
            stateChanged?(self.state)
        }
    }
    
    //MARK: - Closures
    var stateChanged: ((_ state: ViewModelState) -> ())?
}

enum ViewModelState {
    case normal
    case loading
    case empty
    case error(Error?)
}
