//
//  UnacademyCategoryDisplay.swift
//  Unacademy
//
//  Created by Subhodip Banerjee on 08/03/17.
//  Copyright © 2017 Subhodip Banerjee. All rights reserved.
//

import Foundation
import SwiftyJSON

class UnacademyCategoryDisplay: NSObject{
    
    //MARK: - Model Class Variables
    var categoryDisplay: String?
    
    //MARK: - Init
    init(json: JSON){
        
        super.init()        
        
        if let courseDisplay = json["category_display"].string{
            categoryDisplay = courseDisplay
        }else{
            categoryDisplay = UrlConstants.notApplicable
        }
        
    }
}
