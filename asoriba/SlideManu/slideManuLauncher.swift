//
//  slideManuLauncher.swift
//  asoriba
//
//  Created by Benjamin Acquah on 7/16/17.
//  Copyright © 2017 Asoriba. All rights reserved.
//

import UIKit

class SlideManuLauncher: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let ManuCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rgb(red: 0, green: 165, blue: 240)
        return cv
    }()
    
    let cellId = "cellId"
    let manuNames = ["My profile", "Send feedback", "Help", "Cancel"]
    let manuImages = ["profile", "feedback", "help", "cancel"]
    let blueView = UIView()
    
    func handleSliderLauncher(){
        
        if let window = UIApplication.shared.keyWindow{
            //show manu
            blueView.backgroundColor = UIColor(white: 0, alpha: 0.0)
            
            //allow dismiss on blue view
            blueView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSlideManuDismiss)))
            
            window.addSubview(blueView)
            window.addSubview(ManuCollectionView)
            
            let height : CGFloat = 200
            let y = window.frame.height - height
            ManuCollectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: 200)
            
            blueView.frame = window.frame
            blueView.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blueView.alpha = 1
                self.ManuCollectionView.frame = CGRect(x: 0, y: y, width: self.ManuCollectionView.frame.width, height: self.ManuCollectionView.frame.height)
            }, completion: nil)
            
        }
        
    }
    
    @objc func handleSlideManuDismiss(){
        UIView.animate(withDuration: 0.5) {
            self.blueView.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
                self.ManuCollectionView.frame = CGRect(x: 0, y: window.frame.height, width: self.ManuCollectionView.frame.width, height: self.ManuCollectionView.frame.height)
            }
        }
    }
    
    //conform to collectionView Layout
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! manuSliderCell
        cell.itemImage.image = UIImage(named: manuImages[indexPath.item])?.withRenderingMode(.alwaysOriginal)
        cell.itemImage.tintColor = .white
        cell.nameLbl.text = manuNames[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ManuCollectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blueView.alpha = 0
            if let window = UIApplication.shared.keyWindow {
                self.ManuCollectionView.frame = CGRect(x: 0, y: window.frame.height, width: self.ManuCollectionView.frame.width, height: self.ManuCollectionView.frame.height)
            }
        }) { (completed: Bool) in
            
            
        }
    }
    
    override init() {
        super.init()
        
        //implement collectionView
        self.ManuCollectionView.delegate = self
        self.ManuCollectionView.dataSource = self
        
        ManuCollectionView.register(manuSliderCell.self, forCellWithReuseIdentifier: cellId)
    }
}
