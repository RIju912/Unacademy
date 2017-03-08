//
//  UnTextMoDel.swift
//  Unacademy
//
//  Created by Subhodip Banerjee on 08/03/17.
//  Copyright © 2017 Subhodip Banerjee. All rights reserved.
//

import Foundation

class UnTextMoDel {
    static func createDataForTxtView(txtDataJson:NSArray) -> [LableBk]
    {
        var txtModelData : [LableBk]=[]
        for  i in 0 ..< txtDataJson.count {
            let tagData = txtDataJson[i]
            
            do {
                let data = LableBk(category: "txt", title: tagData as! String)
                txtModelData.append(data)
            }
        }
        return txtModelData
    }
}
