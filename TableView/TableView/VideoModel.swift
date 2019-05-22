//
//  tableview2.swift
//  TableView
//
//  Created by Nguyen Hoang Huy on 5/10/19.
//  Copyright © 2019 Nguyen Hoang Huy. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift


class VideoModel:Object{

    @objc dynamic var namevideo:String = ""
    @objc dynamic var namechanel:String = ""
    @objc dynamic var detailvideo: Data!
    @objc dynamic var status: Bool = true
    @objc dynamic var detailstatus:String = ""
    
    public convenience init(namevideo:String,namechanel:String,detailvideo: Data,status:Bool,detailstatus:String) {
        self.init()
        self.namevideo = namevideo
        self.namechanel = namechanel
        self.detailvideo = detailvideo
        self.status = status
        self.detailstatus = detailstatus
    }

}
