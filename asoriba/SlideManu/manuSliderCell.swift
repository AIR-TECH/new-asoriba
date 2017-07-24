//
//  manuSliderCell.swift
//  asoriba
//
//  Created by Benjamin Acquah on 7/16/17.
//  Copyright © 2017 Asoriba. All rights reserved.
//

import UIKit

class manuSliderCell: UICollectionViewCell {
    
    let nameLbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "Profile"
        lbl.textColor = .white
        lbl.font = UIFont.systemFont(ofSize: 13)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let itemImage : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "profile")?.withRenderingMode(.alwaysOriginal)
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override var isHighlighted: Bool {
        didSet{
            backgroundColor = isHighlighted ? UIColor(white: 0, alpha: 0.5) : UIColor.clear
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(nameLbl)
        addSubview(itemImage)
        
        //x-axis
        addConstraintsWithFormat(format: "H:|-8-[v0(30)]-8-[v1]|", views: itemImage, nameLbl)
        //y-axis for label
        addConstraintsWithFormat(format: "V:|[v0]|", views: nameLbl)
        //y-axis for itemImage
        addConstraintsWithFormat(format: "V:[v0(30)]", views: itemImage)
        
        addConstraint(NSLayoutConstraint(item: itemImage, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
