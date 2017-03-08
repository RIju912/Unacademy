//
//  TextViewCell.swift
//  Unacademy
//
//  Created by Subhodip Banerjee on 08/03/17.
//  Copyright © 2017 Subhodip Banerjee. All rights reserved.
//

import UIKit

class TextViewCell: UITableViewCell,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var tableView: UITableView!
    var textArray: NSArray = []
    var arrDataModel: UnacademyDatasource?
    
    var secondPartImageArray : NSArray = []
    var totalArray : NSArray = ["ugvuuvlvulvyyvlyvlvyvlylvylvvl", "ugvuuvlvulvyyvlyvlvyvlylvylvvl", "ugvuuvlvulvyyvlyvlvyvlylvylvvl"]
    var textV = [LableBk]()
    
    var numOfColumns : Int = 2
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.tableView.register(UINib(nibName: "TextLabelCell", bundle: nil), forCellReuseIdentifier: "TextLabelCell")
        
        self.textV = UnTextMoDel.createDataForTxtView(txtDataJson: self.totalArray.mutableCopy() as! NSArray)
        
        
    }
    
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    internal func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextLabelCell", for: indexPath)
        self.configureCell(cell, atIndexPath: indexPath)
        return cell
    }
    
    private func configureCell(_ object: AnyObject, atIndexPath indexPath: IndexPath) {
        if object.isKind(of: TextLabelCell.classForCoder()) == false {
            abort()
        }
        let cell = object as! TextLabelCell
        
        cell.txtlabel.setTags(textV)
        self.heightConstraint.constant = cell.contentView.frame.height//cell.contentView.height()
        
        let totalCellH = Double(cell.txtlabel.getTotalWidth())/Double(cell.contentView.frame.width)
        print("myNoofLine:\(totalCellH)")
        if totalCellH>1 {
            self.heightConstraint.constant = CGFloat(Double(totalCellH*60))
            
        }
        
    }
    
    // MARK: - UITableViewDelegate
    
    internal func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1000
    }
    
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
