//
//  findFriendsVC.swift
//  asoriba
//
//  Created by Benjamin Acquah on 7/17/17.
//  Copyright © 2017 Asoriba. All rights reserved.
//

import UIKit

class addFriendsVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false
        collectionView?.backgroundColor = .white
    }
}
