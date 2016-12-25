//
//  Band.swift
//  IsobarApp
//
//  Created by Humberto Vieira on 23/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper
import RealmSwift


class Band: Object, Mappable {
    /// This function can be used to validate JSON prior to mapping. Return nil to cancel mapping at this point
    required convenience init?(map: Map) {
        self.init()
    }

    dynamic var id: String!
    dynamic var name: String!
    dynamic var genre: String!
    dynamic var urlImage: String!
    dynamic var country: String!
    dynamic var country_flag: String!
    dynamic var website: String!

    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.name <- map["name"]
        self.genre <- map["genre"]
        self.country <- map["country"]
        self.country_flag <- map["country_flag"]
        self.website <- map["website"]
        self.urlImage <- map["image"]

        let realm = try! Realm()
        try! realm.write {
            realm.add(self, update: true)
        }

       // requestRealm()
    }
    
    override static func primaryKey() -> String? {
        return "name"
    }
    
    func requestRealm() {
        let realm = try! Realm()

        let plist = realm.objects(Band.self)
        for p in plist {
            print(p.name)
        }
        print(plist.count)
        
    }
    
    
    
    
}
