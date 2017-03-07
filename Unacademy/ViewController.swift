//
//  ViewController.swift
//  Unacademy
//
//  Created by Subhodip Banerjee on 06/03/17.
//  Copyright © 2017 Subhodip Banerjee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var iboTableView: UITableView!{
        
        didSet {
            
            iboTableView.estimatedRowHeight = 60.0
            iboTableView.rowHeight = UITableViewAutomaticDimension
            
        }
    }
    var arrDataSource: UnacademyAPIResults?

    override func viewDidLoad() {
        super.viewDidLoad() 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UnacademyService.sharedInstance().getAllCourses {(collection:UnacademyDatasource?, error:Error?) -> Void in
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

