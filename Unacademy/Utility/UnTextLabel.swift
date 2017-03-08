//
//  UnTextLabel.swift
//  Unacademy
//
//  Created by Subhodip Banerjee on 08/03/17.
//  Copyright © 2017 Subhodip Banerjee. All rights reserved.
//

import UIKit

//Change here light gray

struct LableBk {
    var category: String
    var title: String
    
    func attributedTitle() -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.firstLineHeadIndent = 10
        paragraphStyle.headIndent = 10
        paragraphStyle.tailIndent = 10
        
        
        let attributes = [
            NSParagraphStyleAttributeName  : paragraphStyle,
            NSFontAttributeName            : UIFont(name: "AvenirNext-Regular", size: 14.0)!,
            NSForegroundColorAttributeName : UIColor.lightGray//UIColor(hexString:"15181b")
        ]
        return NSAttributedString(string: self.title, attributes: attributes)
    }
}


class UnTextLabel: UILabel {
    
    open var tags: [LableBk]?
    var totalWidth = 0 as Double
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setup()
    }
    
    
    
    private func setup() {
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
        self.textAlignment = .center
        self.backgroundColor = UIColor.white
        self.isUserInteractionEnabled = true
        
        
    }
    
    
    
    open func setTags(_ tags: [LableBk]) {
        self.tags = tags
        
        let mutableString = NSMutableAttributedString()
        let cell = UITableViewCell()
        for (_, tag) in tags.enumerated() {
            let view = TextView()
            view.label.attributedText = tag.attributedTitle()
            view.label.backgroundColor = UIColor.white.withAlphaComponent(0.98)
            view.label.textAlignment = .center
            let size = view.systemLayoutSizeFitting(view.frame.size,
                                                    withHorizontalFittingPriority: UILayoutPriorityFittingSizeLevel,
                                                    verticalFittingPriority: UILayoutPriorityFittingSizeLevel)
            view.frame = CGRect(x: 0, y: 0, width: size.width + 20, height: size.height)
            cell.contentView.addSubview(view)
            let image = view.image()
            let attachment = NSTextAttachment()
            attachment.image = image
            
            self.totalWidth += Double(size.width+25)
            let attrString = NSAttributedString(attachment: attachment)
            mutableString.beginEditing()
            mutableString.append(attrString)
            mutableString.endEditing()
        }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        mutableString.addAttribute(NSParagraphStyleAttributeName,
                                   value: paragraphStyle,
                                   range: NSRange(location: 0, length: mutableString.length))
        self.attributedText = mutableString
    }
    
    open func getTotalWidth() -> Double{
        return self.totalWidth
    }
    
}
