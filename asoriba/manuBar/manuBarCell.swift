//
//  manuBarCell.swift
//  asoriba
//
//  Created by Benjamin Acquah on 7/16/17.
//  Copyright © 2017 Asoriba. All rights reserved.
//

import UIKit

class manuBarCell: UICollectionViewCell {
    
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named:"church")?.withRenderingMode(.alwaysTemplate)
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override var isHighlighted: Bool {
        didSet{
            imageView.tintColor = isHighlighted ? UIColor.rgb(red: 7, green: 67, blue: 120) : UIColor.white
        }
    }
    
    override var isSelected: Bool {
        didSet{
            imageView.tintColor = isSelected ? UIColor.rgb(red: 7, green: 67, blue: 120) : UIColor.white
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    func setUpViews(){
        addSubview(imageView)
        addConstraintsWithFormat(format: "H:[v0(28)]", views: imageView)
        addConstraintsWithFormat(format: "V:[v0(28)]", views: imageView)
        
        //center vertically
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        
        //center horizontally
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
