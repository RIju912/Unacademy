//
//  UnacademySingleton.swift
//  Unacademy
//
//  Created by Subhodip Banerjee on 07/03/17.
//  Copyright © 2017 Subhodip Banerjee. All rights reserved.
//

import Foundation

class UnacademySingleton {
    
    static let sharedInstance : UnacademySingleton = {
        let instance = UnacademySingleton()
        return instance
    }()
    
    var arrayOfTestPreparations = [String]()
    var arrayOfOthers = [String]()
    var arrayOfTestProgramming = [String]()
    var arrayOfTestLanguage = [String]()
    var arrayOfJobPreparations = [String]()

}
