//
//  Setting.swift
//  
//
//  Created by 別府優介 on 2017/12/14.
//
//

import Foundation
import RealmSwift

class Setting: Object {
    // 管理用 ID。プライマリーキー
    dynamic var id = 0
    
    dynamic var name = ""
    
    
    dynamic var InTime1 = NSDate()
    
     dynamic var InTime2 = NSDate()
    
     dynamic var InTime3 = NSDate()
    
     dynamic var OutTime1 = NSDate()
    
     dynamic var OutTime2 = NSDate()
    
     dynamic var OutTime3 = NSDate()
    /**
     id をプライマリーキーとして設定
     */
    override static func primaryKey() -> String? {
        return "id"
    }
}
