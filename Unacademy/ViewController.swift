//
//  ViewController.swift
//  Unacademy
//
//  Created by Subhodip Banerjee on 06/03/17.
//  Copyright © 2017 Subhodip Banerjee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UnacademyService.sharedInstance().getAllCourses {(collection:UnacademyDatasource?, error:Error?) -> Void in
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

