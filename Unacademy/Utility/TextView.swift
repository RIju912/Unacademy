//
//  TextView.swift
//  Unacademy
//
//  Created by Subhodip Banerjee on 08/03/17.
//  Copyright © 2017 Subhodip Banerjee. All rights reserved.
//

import UIKit

class TextView: UIView {
    
    lazy var label = { () -> UILabel in
        let label = UILabel()
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 11.5
        label.layer.masksToBounds = true
        label.layer.shadowOffset = CGSize(width: 0, height: 0)
        label.layer.shadowOpacity = 1
        label.layer.shadowRadius = 6
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupViews()
    }
    
    
    
    private func setupViews() {
        self.backgroundColor = UIColor.white
        self.addSubview(self.label)
        self.setupConstraints()
    }
    
    private func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-4.0-[label]-4.0-|",
                                                                      options: .directionLeadingToTrailing,
                                                                      metrics: nil,
                                                                      views: ["label" : self.label]))
        constraints.append(NSLayoutConstraint(item: self.label,
                                              attribute: .height,
                                              relatedBy: .greaterThanOrEqual,
                                              toItem: nil,
                                              attribute: .height,
                                              multiplier: 1,
                                              constant: 24))
        constraints.append(NSLayoutConstraint(item: self.label,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .top,
                                              multiplier: 1,
                                              constant: 3))
        constraints.append(NSLayoutConstraint(item: self,
                                              attribute: .bottom,
                                              relatedBy: .equal,
                                              toItem: self.label,
                                              attribute: .bottom,
                                              multiplier: 1,
                                              constant: 3))
        
        let horizontalConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.label, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        constraints.append(horizontalConstraint)
        
        let verticalConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self.label, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)
        constraints.append(verticalConstraint)
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
    func image() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.frame.size, true, 0)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        self.layer.render(in: context)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            return nil
        }
        UIGraphicsEndImageContext()
        return image
    }
}
