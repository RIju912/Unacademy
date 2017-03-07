//
//  UnacademyAPIResults.swift
//  Unacademy
//
//  Created by Subhodip Banerjee on 06/03/17.
//  Copyright © 2017 Subhodip Banerjee. All rights reserved.
//

import Foundation
import SwiftyJSON


class UnacademyAPIResults: NSObject{
    
    //MARK: - Model Class Variables
    var shortName: String?
    var categoryDisplay: String?
    
    //MARK: - Init
    init(json: JSON){
        
        super.init()
        
        if let courseName = json["short_name"].string{
            shortName = courseName
        }else{
            shortName = UrlConstants.notApplicable
        }
        
        
        if let courseDisplay = json["category_display"].string{
            categoryDisplay = courseDisplay
        }else{
            categoryDisplay = UrlConstants.notApplicable
        }
        
    }
    
    //MARK: - Clear Data
    func clear() {
        shortName = ""
        categoryDisplay = ""
    }
    
}
