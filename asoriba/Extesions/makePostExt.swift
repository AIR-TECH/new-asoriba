//
//  makePostExt.swift
//  asoriba
//
//  Created by Benjamin Acquah on 7/16/17.
//  Copyright © 2017 Asoriba. All rights reserved.
//

import UIKit

extension feedVC{
    
    func setUpMakePostView(){
        
        view.addSubview(makePost)
        
        makePost.backgroundColor = .white
        
        //x-axis
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: makePost)
        //y-axis
        view.addConstraintsWithFormat(format: "V:[v0(50)]", views: makePost)
        
        if #available(iOS 11.0, *) {
            makePost.safeAreaLayoutGuide.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
            
        } else {
            // Fallback on earlier versions
            makePost.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
            
        }
    }
}
