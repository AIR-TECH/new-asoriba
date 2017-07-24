//
//  makePost.swift
//  asoriba
//
//  Created by Benjamin Acquah on 7/16/17.
//  Copyright © 2017 Asoriba. All rights reserved.
//

import UIKit

class makepostView: UIView {
    
    let userImage : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = .white
        img.layer.cornerRadius = 20
        img.layer.masksToBounds = true
        img.layer.borderWidth = 2
        img.layer.borderColor = UIColor.rgb(red: 0, green: 165, blue: 240).cgColor
        return img
    }()
    
    let makePostBotton : UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Share something with the world ...", for: UIControlState.normal)
        btn.contentEdgeInsets = UIEdgeInsetsMake(20, -20, 0, 0)
        btn.setTitleColor(UIColor.rgb(red: 0, green: 165, blue: 240), for: UIControlState.normal)
        btn.backgroundColor = .white
        return btn
    }()
    
    let thinLine : UILabel = {
        let line = UILabel()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = UIColor.rgb(red: 0, green: 165, blue: 240)
        return line
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setUpViews()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func setUpViews(){
        
        addSubview(userImage)
        addSubview(makePostBotton)
        addSubview(thinLine)
        
        //x-axis
        addConstraintsWithFormat(format: "H:|-5-[v0(40)]", views: userImage)
        //y-axis
        addConstraintsWithFormat(format: "V:|-10-[v0(40)]", views: userImage)
        
        //x-axis
        addConstraintsWithFormat(format: "H:|-5-[v0(40)]-5-[v1]|", views: userImage, makePostBotton)
        //y-axis
        addConstraintsWithFormat(format: "V:|-5-[v0]|", views: makePostBotton)
        
        thinLine.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        thinLine.leftAnchor.constraint(equalTo: makePostBotton.leftAnchor).isActive = true
        thinLine.rightAnchor.constraint(equalTo: rightAnchor, constant: -5).isActive = true
        thinLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
