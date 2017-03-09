//
//  Constants.swift
//  Unacademy
//
//  Created by Subhodip Banerjee on 06/03/17.
//  Copyright © 2017 Subhodip Banerjee. All rights reserved.
//

import Foundation
import UIKit


//MARK: - Constants
struct UrlConstants {
    
    static var tutorialListAPI = "https://api.myjson.com/"
    static var notApplicable = "N/A"
    
}

//MARK: - Extension
extension UIViewController {
    
    //MARK: - default alert/info message with an OK button.
    func showAlertMessage(_ message: String, okButtonTitle: String = "Ok") -> Void {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: okButtonTitle, style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}
