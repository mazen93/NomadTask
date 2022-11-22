

import Foundation
import UIKit

class Alert{
    
    typealias AlertAction = () -> Void
    private static let appColor = UIColor(named: "mainColor")

    /// Show alert over a specific presented view controller.
    static func showAlert(viewController:UIViewController, title: String, message: String? = nil, action1Title: String? = nil, action1Style:UIAlertAction.Style = .default, action2Title: String? = nil, action2Style:UIAlertAction.Style = .default, action3Title: String? = nil, action3Style:UIAlertAction.Style = .default, action1Selected: AlertAction? = nil, action2Selected: AlertAction? = nil, action3Selected: AlertAction? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if(action1Title != nil) {
            alert.addAction(UIAlertAction(title: action1Title, style: action1Style, handler: { action in action1Selected?() }))
        }
        
        if(action2Title != nil) {
            alert.addAction(UIAlertAction(title: action2Title, style: action2Style, handler: { action in action2Selected?() }))
        }
        
        if(action3Title != nil) {
            alert.addAction(UIAlertAction(title: action3Title, style: action3Style, handler: { action in action3Selected?() }))
        }
        
        alert.view.tintColor = appColor
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
  }

