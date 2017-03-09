//
//  UnacademyShortName.swift
//  Unacademy
//
//  Created by Subhodip Banerjee on 08/03/17.
//  Copyright © 2017 Subhodip Banerjee. All rights reserved.
//

import Foundation
import SwiftyJSON

class UnacademyShortName: NSObject{
    
    //MARK: - Model Class Variables
    var shortName: String?
    var categoryName: String?
    
    //MARK: - Init
    init(json: JSON){
        
        super.init()
        
        if let courseName = json["short_name"].string , let categryN = json["category_display"].string{
            shortName = courseName
            categoryName = categryN
        }else{
            shortName = UrlConstants.notApplicable
            categoryName = UrlConstants.notApplicable
        }
        
        
    }
}
