//
//  ViewController.swift
//  asoriba
//
//  Created by Benjamin Acquah on 7/15/17.
//  Copyright © 2017 Asoriba. All rights reserved.
//

import UIKit

let cellId = "cellId"

class feedVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var myFeeds = [feeds]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let testFeed = feeds()
        testFeed.name = "Nana Agymang Prempeh"
        testFeed.contentText = "All is Good and i know that all is good for his development coming up pretty really good tiome soon and maybe the best of breakthrough is about to happen here in asoriba"
        testFeed.profileImageName = "profileImage1"
        testFeed.postImage = "postImage1"
        
        let secondtest = feeds()
        secondtest.name = "jesse johnson"
        secondtest.contentText = "everything is going to change in our mobile department with respect to IOS when i am done with this app everything is going to change in our mobile department with respect to IOS when i am done with everything is going to change in our mobile department with respect to IOS when i am done with"
        secondtest.profileImageName = "profileImage2"
        secondtest.postImage = "postImage2"
        
        myFeeds.append(testFeed)
        myFeeds.append(secondtest)
        
        self.navigationController?.navigationBar.isTranslucent = false
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        collectionView?.alwaysBounceVertical = true
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.showsVerticalScrollIndicator = false
        //hides tabBar on scroll to bottom
                
        //register all post Cells
        collectionView?.register(feedCell.self, forCellWithReuseIdentifier: cellId)
        //collectionView?.register(feedWithAudioCell.self, forCellWithReuseIdentifier: cellId)
        //collectionView?.register(feedWithVideoCell.self, forCellWithReuseIdentifier: cellId)
        
        //setUpManuBar()
        setUpMakePostView()
        setUpNavBarItems()
    }

    let makePost : makepostView = {
        let post = makepostView()
        post.backgroundColor = .white
        return post
    }()
    
    //reveal slide-up manu
    let launcher = SlideManuLauncher()
    @objc func handleMore(){
        launcher.handleSliderLauncher()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myFeeds.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! feedCell
        
        cell.myFeed = myFeeds[indexPath.item]
        cell.feedController = self

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let contentTexts = myFeeds[indexPath.item].contentText{
            let rect = NSString(string: contentTexts).boundingRect(with: CGSize(width: view.frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14)], context: nil)
            
            let knownHeight : CGFloat = 8 + 44 + 4 + 4 + 200 + 8 + 24 + 8 + 44
            
            return CGSize(width: view.frame.width, height: rect.height + knownHeight + 24)
        }
        return CGSize(width: self.view.frame.size.width, height: 400)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView?.collectionViewLayout.invalidateLayout()
    }
    
    let zoomView = UIImageView()
    let blackBackgroundView = UIView()
    let navBarCoverView = UIView()
    let tabBarCoverView = UIView()
    var contentImageView : UIImageView?
    
    func animateZoom(contentImage: UIImageView){
        self.contentImageView = contentImage
        
        if let startingFrame = contentImage.superview?.convert(contentImage.frame, to: nil){
            
            contentImage.alpha = 0
            blackBackgroundView.frame = self.view.frame
            blackBackgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            blackBackgroundView.alpha = 0
            view.addSubview(blackBackgroundView)
            
            navBarCoverView.frame = CGRect(x: 0, y: 0, width: 1000, height: 20 + 44)
            navBarCoverView.backgroundColor = .black
            navBarCoverView.alpha = 0
            
            if let keyWindow = UIApplication.shared.keyWindow{
                keyWindow.addSubview(navBarCoverView)
                tabBarCoverView.frame = CGRect(x: 0, y: keyWindow.frame.height - 49, width: 1000, height: 49)
                tabBarCoverView.backgroundColor = .black
                tabBarCoverView.alpha = 0
                keyWindow.addSubview(tabBarCoverView)
            }
            
            zoomView.backgroundColor = .red
            zoomView.frame = startingFrame
            zoomView.isUserInteractionEnabled = true
            zoomView.image = contentImage.image
            zoomView.contentMode = .scaleAspectFill
            zoomView.clipsToBounds = true
            zoomView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(zoomOutImage)))
            view.addSubview(zoomView)
            
            UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.curveEaseOut, animations: {
                
                let height = (self.view.frame.width / startingFrame.width) * startingFrame.height
                let y = self.view.frame.height / 2 - height / 2
                
                self.zoomView.frame = CGRect(x: 0, y: y, width: self.view.frame.width, height: height)
                self.blackBackgroundView.alpha = 1
                self.navBarCoverView.alpha = 1
                self.tabBarCoverView.alpha = 1
                
            }, completion: nil)
        }
     }
    
    @objc func zoomOutImage(){
        
        if let startingFrame = contentImageView!.superview?.convert(contentImageView!.frame, to: nil){
            UIView.animate(withDuration: 0.75, animations: {
                self.zoomView.frame = startingFrame
                self.blackBackgroundView.alpha = 0
            })
            
            UIView.animate(withDuration: 0.75, animations: {
                self.zoomView.frame = startingFrame
                self.blackBackgroundView.alpha = 0
                self.navBarCoverView.alpha = 0
                self.tabBarCoverView.alpha = 0
                
            }, completion: { (didComplete) in
                self.zoomView.removeFromSuperview()
                self.blackBackgroundView.removeFromSuperview()
                self.navBarCoverView.removeFromSuperview()
                self.tabBarCoverView.removeFromSuperview()
                self.contentImageView?.alpha = 1
                
            })
        }
    }
}

