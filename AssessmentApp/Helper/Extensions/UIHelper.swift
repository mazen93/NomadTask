//
//  UIHelper.swift
//  AssessmentApp
//
//  Created by host on 22/11/2022.
//

import Foundation
import UIKit
struct UIHelpers {
  
    static func emptyCollectionView(collectionView: UICollectionView, dataCount: Int, dataCome: Bool ,emptyMessage: String) -> Int {
        if dataCome {
            if dataCount > 0 {
                collectionView.backgroundView = nil
            } else {
                let noDataLabel: UILabel     = UILabel(frame: CGRect(x: 0, y: 0, width: collectionView.bounds.size.width, height: collectionView.bounds.size.height))
                noDataLabel.text          = emptyMessage
                noDataLabel.textColor     = #colorLiteral(red: 0.6941176471, green: 0.6862745098, blue: 0.6941176471, alpha: 1)
                noDataLabel.textAlignment = .center
                noDataLabel.numberOfLines = 0
                collectionView.backgroundView  = noDataLabel
            }
        } else {
            let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width:50, height: 50))
            if #available(iOS 13.0, *) {
                activityIndicator.style = UIActivityIndicatorView.Style.large
            } else {
                activityIndicator.style = .white
            }
            activityIndicator.color = #colorLiteral(red: 0.6941176471, green: 0.6862745098, blue: 0.6941176471, alpha: 1)
            activityIndicator.center = collectionView.center
            activityIndicator.startAnimating()
            collectionView.backgroundView  = activityIndicator
        }
        
        return dataCount
    }
    
    static func emptyTableView(tableView: UITableView, dataCount: Int, dataCome: Bool ,emptyMessage: String) -> Int {
           if dataCome {
               if dataCount > 0 {
                   tableView.backgroundView = nil
               } else {
                   let noDataLabel: UILabel     = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
                   noDataLabel.text          = emptyMessage
                   noDataLabel.textColor     = #colorLiteral(red: 0.6941176471, green: 0.6862745098, blue: 0.6941176471, alpha: 1)
                   noDataLabel.textAlignment = .center
                   noDataLabel.numberOfLines = 0
                   tableView.backgroundView  = noDataLabel
               }
           } else {
               let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width:50, height: 50))
               if #available(iOS 13.0, *) {
                   activityIndicator.style = UIActivityIndicatorView.Style.large
               } else {
                   activityIndicator.style = .white
               }
               activityIndicator.color = #colorLiteral(red: 0.6941176471, green: 0.6862745098, blue: 0.6941176471, alpha: 1)
            //#colorLiteral(red: 0.6941176471, green: 0.6862745098, blue: 0.6941176471, alpha: 1)
               activityIndicator.center = tableView.center
               activityIndicator.startAnimating()
               tableView.backgroundView  = activityIndicator
           }
           return dataCount
       }

}
