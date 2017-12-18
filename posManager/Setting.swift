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
    
    //とりあえずStringで
    dynamic var InTime1 = ""
    
     dynamic var InTime2 = ""
    
     dynamic var InTime3 = ""
    
     dynamic var OutTime1 = ""
    
     dynamic var OutTime2 = ""
    
     dynamic var OutTime3 = ""
    /**
     id をプライマリーキーとして設定
     */
    override static func primaryKey() -> String? {
        return "id"
    }
}
