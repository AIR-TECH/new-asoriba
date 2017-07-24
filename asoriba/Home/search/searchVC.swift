//
//  searchVC.swift
//  asoriba
//
//  Created by Benjamin Acquah on 7/17/17.
//  Copyright © 2017 Asoriba. All rights reserved.
//

import UIKit

class searchVC : UICollectionViewController, UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate, UICollectionViewDelegateFlowLayout{
    
    var searchController : UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        collectionView?.backgroundColor = .white
        
        setUpSearchNavBarItems()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    @objc func handleSearch(){
        
    }
}
