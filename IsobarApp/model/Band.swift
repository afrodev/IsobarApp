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


class Band: Mappable {
    var id: String!
    var name: String!
    var genre: String!
    var urlImage: String!
    var country: String!
    var country_flag: String!
    var website: String!
    
    
    required init?(map: Map) {
        print(map)
        self.id <- map["id"]
        self.name <- map["name"]
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.name <- map["name"]
        self.genre <- map["genre"]
        self.country <- map["country"]
        self.country_flag <- map["country_flag"]
        self.website <- map["website"]
        self.urlImage <- map["image"]
    }
    
}
