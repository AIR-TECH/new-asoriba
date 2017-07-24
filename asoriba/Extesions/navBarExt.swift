//
//  navBarExt.swift
//  asoriba
//
//  Created by Benjamin Acquah on 7/16/17.
//  Copyright © 2017 Asoriba. All rights reserved.
//

import UIKit

extension feedVC{
    
    func setUpNavBarItems(){
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "  Feeds"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        navigationItem.titleView = titleLabel
        
        let moreImage = UIImage(named: "more")?.withRenderingMode(.alwaysOriginal)
        let moreBarButtonItem = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(handleMore))
        moreBarButtonItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, -15)
        
        navigationItem.rightBarButtonItems = [moreBarButtonItem]
        
        navigationController?.hidesBarsOnSwipe = true
    }
}

extension searchVC{
    
    func setUpSearchNavBarItems(){
        
        self.searchController = UISearchController(searchResultsController:  nil)
        
        self.searchController.searchResultsUpdater = self
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true
        self.searchController.searchBar.barTintColor = UIColor.rgb(red: 0, green: 165, blue: 240)
        self.searchController.searchBar.tintColor = .white
        self.navigationItem.titleView = searchController.searchBar
        
        for subView in searchController.searchBar.subviews {
            for subView1 in subView.subviews{
                if let textField = subView1 as? UITextField{
                    subView1.backgroundColor = UIColor.rgb(red: 0, green: 165, blue: 240)
                    //use the code below if you want to change the color of placeholder
                    let textFieldInsideUISearchBarLabel = textField.value(forKey: "placeholderLabel") as? UILabel
                    textFieldInsideUISearchBarLabel?.textColor = .white
                }
            }
        }
        
        self.definesPresentationContext = true
    }
}
