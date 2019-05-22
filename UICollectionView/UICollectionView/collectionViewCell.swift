//
//  collectionViewCell.swift
//  UICollectionView
//
//  Created by Nguyen Hoang Huy on 5/22/19.
//  Copyright © 2019 Nguyen Hoang Huy. All rights reserved.
//

import UIKit

class collectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myNameImage: UILabel!
    @IBOutlet weak var myNameChanel: UILabel!
    @IBOutlet weak var myImageStatus: UIImageView!
    @IBOutlet weak var myStatus: UILabel!
    
    func setImage(image:Image)  {
        myNameImage.text = image.nameImage
        myNameChanel.text = image.nameChanel
        myImage.image = UIImage.init(data:image.img)
        if image.status{
            myImageStatus.image = UIImage.init(named:"checked")
            myStatus.text = "Đã đăng ký"
        }else{
            myImageStatus.image = UIImage.init(named:"round")
            myStatus.text = "Chưa đăng ký"
        }
    }
    
}
