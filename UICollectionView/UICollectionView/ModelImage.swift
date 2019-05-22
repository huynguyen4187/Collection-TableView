//
//  File.swift
//  UICollectionView
//
//  Created by Nguyen Hoang Huy on 5/22/19.
//  Copyright © 2019 Nguyen Hoang Huy. All rights reserved.
//

import Foundation
import UIKit

class Image:NSObject {
    var nameImage:String = ""
    var  nameChanel:String = ""
    var status:Bool = true
    var img:Data!
    
    public convenience init(nameImage:String, nameChanel:String, status:Bool, img:Data) {
        self.init()
        self.nameImage = nameImage
        self.nameChanel = nameChanel
        self.status = status
        self.img = img
    }
}
