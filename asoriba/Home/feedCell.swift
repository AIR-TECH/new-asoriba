//
//  feedCell.swift
//  asoriba
//
//  Created by Benjamin Acquah on 7/16/17.
//  Copyright © 2017 Asoriba. All rights reserved.
//

import UIKit

class feedCell: UICollectionViewCell {
    
    let backView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let userNameLbl : UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2

        return lbl
    }()
    
    //arrow_down for more
    let moreImg : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "arrow_down")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleMore)))
        return img
    }()
    
    let userAva : UIImageView = {
        let ava = UIImageView()
        ava.image = UIImage(named: "user")
        ava.contentMode = .scaleAspectFill
        ava.layer.cornerRadius = 22
        ava.layer.masksToBounds = true
        return ava
    }()
    
    let contentTextView : UITextView = {
        let txt = UITextView()
        txt.text = "Asoriba church management software is..."
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.font = UIFont.systemFont(ofSize: 14)
        txt.isScrollEnabled = false
        txt.isEditable = false
        return txt
    }()
    
    //content image
    let contentImage : UIImageView = {
        let contentImg = UIImageView()
        contentImg.image = UIImage(named: "")
        contentImg.contentMode = .scaleAspectFill
        contentImg.layer.masksToBounds = true
        contentImg.translatesAutoresizingMaskIntoConstraints = false
        contentImg.isUserInteractionEnabled = true
        return contentImg
    }()
    
    //content audio
    
    //content Video
    
    //amen counts
    let amenComentsShareLbl : UILabel = {
        let counter = UILabel()
        counter.text = "500 Amened " + "3K Comments " + "200 Shared"
        counter.translatesAutoresizingMaskIntoConstraints = false
        counter.font = UIFont.systemFont(ofSize: 12)
        counter.textColor = UIColor.rgb(red: 155, green: 161, blue: 171)
        return counter
    }()
    
    //divider line
    let dividerLine : UIView = {
        let divider = UIView()
        divider.backgroundColor = UIColor.rgb(red: 226, green: 228, blue: 232)
        divider.translatesAutoresizingMaskIntoConstraints = false
        return divider
    }()
    
    //like botton
    let likeBtn = feedCell.buttonForTitle(title: "Amen", imageName: "pray_gray")
    let commentBtn = feedCell.buttonForTitle(title: "Comment", imageName: "comment")
    let shareBtn = feedCell.buttonForTitle(title: "Share", imageName: "share")
    
    static func buttonForTitle(title: String, imageName: String) -> UIButton {
        let btn = UIButton()
        btn.setTitle(title, for: UIControlState.normal)
        btn.setImage(UIImage(named: imageName), for: UIControlState.normal)
        btn.setTitleColor(UIColor.rgb(red: 143, green: 150, blue: 163), for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        return btn
    }
    
    
    var myFeed : feeds?{
        
        didSet{
            
            if let name = myFeed?.name{
                let attributedText = NSMutableAttributedString(string: name, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14)])
                
                attributedText.append(NSAttributedString(string: "\nDate - Location  ", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: UIColor.rgb(red: 155, green: 161, blue: 171)]))
                
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineSpacing = 4
                
                attributedText.addAttributes([NSAttributedStringKey.paragraphStyle : paragraphStyle], range: NSMakeRange(0, attributedText.string.characters.count))
                
                let attatchment = NSTextAttachment()
                attatchment.image = UIImage(named: "location_icon")
                attatchment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
                attributedText.append(NSAttributedString(attachment: attatchment))
                
                userNameLbl.attributedText = attributedText
            }
            
            if let contenttext = myFeed?.contentText{
                contentTextView.text = contenttext
            }
            
            if let profileImagename = myFeed?.profileImageName{
                userAva.image = UIImage(named: profileImagename)
            }
            
            if let postImage = myFeed?.postImage{
                contentImage.image = UIImage(named: postImage)
            }
        }
    }
    
    var feedController : feedVC?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        backgroundColor = .white
        
    }
    
    @objc func handleMore(){
        
    }
    
    @objc func zoomAnimate(){
        feedController?.animateZoom(contentImage: contentImage)
    }
    
    func setUpViews(){
        
        addSubview(userNameLbl)
        addSubview(moreImg)
        addSubview(userAva)
        addSubview(contentTextView)
        addSubview(contentImage)
        addSubview(amenComentsShareLbl)
        addSubview(dividerLine)
        
        addSubview(likeBtn)
        addSubview(commentBtn)
        addSubview(shareBtn)
        
        contentImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(zoomAnimate)))
        
        //left to right
        addConstraintsWithFormat(format: "H:|-8-[v0(44)]-8-[v1]|", views: userAva, userNameLbl)
        addConstraintsWithFormat(format: "H:|-4-[v0]-4-|", views: contentTextView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: contentImage)
        addConstraintsWithFormat(format: "H:|-12-[v0]|", views: amenComentsShareLbl)
        addConstraintsWithFormat(format: "H:|-12-[v0]-12-|", views: dividerLine)
        
        //buttons
        addConstraintsWithFormat(format: "H:|[v0(v2)][v1(v2)][v2]|", views: likeBtn, shareBtn, commentBtn)
        
        //username: top to buttom
        addConstraintsWithFormat(format: "V:|-12-[v0]", views: userNameLbl)
        
        //profileImage,contentTextView,contentImage,amens/shares/coments,divider,likeBtns top to buttom
        addConstraintsWithFormat(format: "V:|-8-[v0(44)]-4-[v1]-4-[v2(200)]-8-[v3(24)]-8-[v4(0.5)][v5(44)]|", views: userAva, contentTextView, contentImage, amenComentsShareLbl, dividerLine, likeBtn)
        
        addConstraintsWithFormat(format: "V:[v0(44)]|", views: commentBtn)
        addConstraintsWithFormat(format: "V:[v0(44)]|", views: shareBtn)
        
        //moreImg
        moreImg.topAnchor.constraint(equalTo: userNameLbl.topAnchor).isActive = true
        moreImg.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        moreImg.heightAnchor.constraint(equalToConstant: 20).isActive = true
        moreImg.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}











//feedCell With Audio

class feedWithAudioCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class feedWithVideoCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
