//
//  tabBarVC.swift
//  asoriba
//
//  Created by Benjamin Acquah on 7/17/17.
//  Copyright © 2017 Asoriba. All rights reserved.
//

import UIKit

class tabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.barTintColor = UIColor.rgb(red: 0, green: 165, blue: 240)
        self.tabBar.selectedItem?.badgeColor = .blue
        self.tabBar.tintColor = .white
        self.tabBar.isTranslucent = false
        
        //setUp Home Feed View Controller in Tab Bar
        let layout = UICollectionViewFlowLayout()
        let feed = feedVC(collectionViewLayout: layout)
        let homeFeed = UINavigationController(rootViewController: feed)
        homeFeed.tabBarItem.title = "Feed"
        homeFeed.hidesBarsOnSwipe = true
        homeFeed.tabBarItem.image = UIImage(named: "church")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        homeFeed.tabBarItem.tag = 0

        //setUp Search Church Controller in Tab Bar
        let searchLayout = UICollectionViewFlowLayout()
        let Search = searchVC(collectionViewLayout: searchLayout)
        let allSearch = UINavigationController(rootViewController: Search)
        allSearch.tabBarItem.title = "Search"
        allSearch.tabBarItem.image = UIImage(named: "search")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        allSearch.tabBarItem.tag = 1

        //setUp addfriends Controller In Tab Bar
        let friendLayout = UICollectionViewFlowLayout()
        let friend = addFriendsVC(collectionViewLayout: friendLayout)
        let add = UINavigationController(rootViewController: friend)
        add.tabBarItem.title = "+Friends"
        add.tabBarItem.image = UIImage(named: "friends")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        add.tabBarItem.tag = 2

        //setUP payMent COntroller in Tab Bar
        let pay = UINavigationController(rootViewController: paymentVC())
        pay.tabBarItem.image = UIImage(named: "payment")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        pay.tabBarItem.title = "Payment"
        pay.tabBarItem.tag = 3
        
        //setUp notification Controller In Tab Bar
        let notificationLayout = UICollectionViewFlowLayout()
        let notification = addFriendsVC(collectionViewLayout: notificationLayout)
        let note = UINavigationController(rootViewController: notification)
        note.tabBarItem.title = "notifications"
        note.tabBarItem.image = UIImage(named: "note")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        note.tabBarItem.tag = 4

        
        viewControllers = [homeFeed, allSearch,add,pay,note]
    }
}
