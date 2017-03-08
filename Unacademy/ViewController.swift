//
//  ViewController.swift
//  Unacademy
//
//  Created by Subhodip Banerjee on 06/03/17.
//  Copyright © 2017 Subhodip Banerjee. All rights reserved.
//

import UIKit

extension Array {
    
    func filterDuplicates( includeElement: (_ lhs:Element, _ rhs:Element) -> Bool) -> [Element]{
        var results = [Element]()
        
        forEach { (element) in
            let existingElements = results.filter {
                return includeElement(element, $0)
            }
            if existingElements.count == 0 {
                results.append(element)
            }
        }
        
        return results
    }
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var iboTableView: UITableView!{
        
        didSet {
            
            iboTableView.estimatedRowHeight = 60.0
            iboTableView.rowHeight = UITableViewAutomaticDimension
            
        }
    }
    var arrDataSource: UnacademyAPIResults?
    var arrNames = [UnacademyShortName]()
    var arrDisplayCategory = [UnacademyCategoryDisplay]()
    let sharedInstnce = UnacademySingleton.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        self.iboTableView.register(UINib(nibName: "TextViewCell", bundle: nil), forCellReuseIdentifier: "TextViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UnacademyService.sharedInstance().getAllCourses {(collection:UnacademyDatasource?, error:Error?) -> Void in
            self.arrNames = (collection?.unacademyShortName)!
            self.arrDisplayCategory = (collection?.unacademysCategoryDisplay)!
            self.sharedInstnce.filterArrayCategory = self.arrDisplayCategory.filterDuplicates { $0.categoryDisplay! == $1.categoryDisplay! }
            self.iboTableView.reloadData()
            
        }
    }
    @IBAction func ibaBackPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        arrDataSource?.clear()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if (section == 0) {
            return sharedInstnce.filterArrayCategory[0].categoryDisplay
        }
        else if (section == 1) {
            return sharedInstnce.filterArrayCategory[1].categoryDisplay
        }
        else if (section == 2) {
            return sharedInstnce.filterArrayCategory[2].categoryDisplay
        }
        else if (section == 3) {
            return sharedInstnce.filterArrayCategory[3].categoryDisplay
        }
        else  {
            return sharedInstnce.filterArrayCategory[4].categoryDisplay
        }
        
        
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return sharedInstnce.filterArrayCategory.count
    }
    
    
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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

