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
        self.iboTableView.register(UINib(nibName: "TextViewCell", bundle: nil), forCellReuseIdentifier: "TextViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UnacademyService.sharedInstance().getAllCourses {(collection:UnacademyDatasource?, error:Error?) -> Void in
            
        }
    }
    @IBAction func ibaBackPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        //arrDataSource?.clear()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if (section == 0) {
            return "JOB PREPARATION"
        }
        else if (section == 1) {
            return "LANGUAGE"
        }
        else if (section == 2) {
            return "TEST PREPARATION"
        }
        else  {
            return "PROGRAMMING"
        }
        
        
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return 4
    }
    
    
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var textCell: TextViewCell!
        
        if (indexPath.section == 0) {
            if (textCell == nil) {
                textCell = (tableView.dequeueReusableCell(withIdentifier: "TextViewCell") as? TextViewCell)!
            }
            textCell.selectionStyle = UITableViewCellSelectionStyle.none
            textCell.numOfColumns = 2
            
            return textCell
        }
            
        else if (indexPath.section == 1) {
            if (textCell == nil) {
                textCell = (tableView.dequeueReusableCell(withIdentifier: "TextViewCell") as? TextViewCell)!
            }
            textCell.selectionStyle = UITableViewCellSelectionStyle.none
            textCell.numOfColumns = 2
            
            return textCell
        }
        else if (indexPath.section == 2) {
            if (textCell == nil) {
                textCell = (tableView.dequeueReusableCell(withIdentifier: "TextViewCell") as? TextViewCell)!
            }
            textCell.selectionStyle = UITableViewCellSelectionStyle.none
            textCell.numOfColumns = 2
            
            return textCell
        }
        else if (indexPath.section == 3) {
            
            if (textCell == nil) {
                textCell = (tableView.dequeueReusableCell(withIdentifier: "TextViewCell") as? TextViewCell)!
            }
            textCell.selectionStyle = UITableViewCellSelectionStyle.none
            textCell.numOfColumns = 2
            
            return textCell
        }else{
            if (textCell == nil) {
                textCell = (tableView.dequeueReusableCell(withIdentifier: "TextViewCell") as? TextViewCell)!
            }
            textCell.selectionStyle = UITableViewCellSelectionStyle.none
            textCell.numOfColumns = 2
            return textCell
        }
        
        
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "AvenirNext-Regular", size: 15.0)
        header.textLabel?.textAlignment = NSTextAlignment.center
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.white
        
    }
}

