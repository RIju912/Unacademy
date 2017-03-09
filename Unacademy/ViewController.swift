//
//  ViewController.swift
//  Unacademy
//
//  Created by Subhodip Banerjee on 06/03/17.
//  Copyright © 2017 Subhodip Banerjee. All rights reserved.
//

import UIKit
import NVActivityIndicatorView


var reachability = Reachability()

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

class ViewController: UIViewController, NVActivityIndicatorViewable {
    
    
    @IBOutlet weak var iboTableView: UITableView!{
        
        didSet {
            
            iboTableView.estimatedRowHeight = 60.0
            iboTableView.rowHeight = UITableViewAutomaticDimension
            
        }
    }
    //Mark: - Bunch API result
    var arrDataSource: UnacademyAPIResults?
    //Array API for Name strings
    var arrNames = [UnacademyShortName]()
    //Array API for Name categories
    var arrDisplayCategory = [UnacademyCategoryDisplay]()
    //Singleton for Name Unique categories
    let sharedInstnce = UnacademySingleton.sharedInstance
    let size = CGSize(width: 30, height: 30)
    let refreshControl = UIRefreshControl()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        iboTableView.isHidden = true
        refreshControl.addTarget(self, action: #selector(ViewController.pullToRefresh), for: .valueChanged)
        iboTableView.addSubview(refreshControl)
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityStatusChanged(_:)), name: .reachabilityChanged, object: nil)
        startAnimating(size, message: "Please wait...", type: NVActivityIndicatorType(rawValue: 30)!)
        self.iboTableView.register(UINib(nibName: "TextViewCell", bundle: nil), forCellReuseIdentifier: "TextViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateInterfaceWithCurrent(networkStatus: reachability.currentReachabilityStatus())
    }
    
    //MARK: - Reachbility via API Call & Data loading
    func updateInterfaceWithCurrent(networkStatus: NetworkStatus) {
        switch networkStatus {
        case NotReachable:
            self.showAlertMessage("Sorry, no internet connections available.")
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.0) {
                self.stopAnimating()
            }
            return
        case ReachableViaWiFi:
            self.loadAllCourseData()
        case ReachableViaWWAN:
            self.loadAllCourseData()
        default:
            return
        }
        
    }
    
    func loadAllCourseData(){
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            NVActivityIndicatorPresenter.sharedInstance.setMessage("Processing data...")
        }
        UnacademyService.sharedInstance().getAllCourses {(collection:UnacademyDatasource?, error:Error?) -> Void in
            self.iboTableView.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.0) {
                self.stopAnimating()
            }
            self.arrNames = (collection?.unacademyShortName)!
            self.arrDisplayCategory = (collection?.unacademysCategoryDisplay)!
            self.sharedInstnce.filterArrayCategory = self.arrDisplayCategory.filterDuplicates { $0.categoryDisplay! == $1.categoryDisplay! }
            self.iboTableView.reloadData()
            
        }
    }
    
    func reachabilityStatusChanged(_ sender: NSNotification) {
        guard let networkStatus = (sender.object as? Reachability)?.currentReachabilityStatus() else { return }
        updateInterfaceWithCurrent(networkStatus: networkStatus)
    }
    
    //MARK: - Pull to Refresh
    func pullToRefresh() {
        startAnimating(size, message: "Loading...", type: NVActivityIndicatorType(rawValue: 30)!)
        iboTableView.isHidden = true
        updateInterfaceWithCurrent(networkStatus: reachability.currentReachabilityStatus())
        refreshControl.endRefreshing()
        return
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
            return sharedInstnce.filterArrayCategory[section].categoryDisplay
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return sharedInstnce.filterArrayCategory.count
    }
    
    
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var textCell: TextViewCell!
        
            if (textCell == nil) {
                textCell = (tableView.dequeueReusableCell(withIdentifier: "TextViewCell") as? TextViewCell)!
            }
            textCell.selectionStyle = UITableViewCellSelectionStyle.none
            textCell.numOfColumns = 2
            textCell.categoryTypeName = sharedInstnce.filterArrayCategory[indexPath.section].categoryDisplay
            textCell.textArray = self.arrNames
            return textCell
        
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "AvenirNext-Regular", size: 15.0)
        header.textLabel?.textAlignment = NSTextAlignment.center
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.white
        
    }
}

