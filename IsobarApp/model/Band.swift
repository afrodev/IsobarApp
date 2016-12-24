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
    var urlImage: URL!
    var country: String!
    var country_flag: URL!
    var website: String!
    
    
    required init?(map: Map) {
        print(map)
        self.id <- map["id"]
        self.name <- map["name"]
    }
    
    func mapping(map: Map) {
        self.genre <- map["genre"]
        self.country <- map["country"]
        self.country_flag <- map["country_flag"]
        self.website <- map["website"]
        self.urlImage <- map["image"]
    }
    /*
    init(json: JSON) {
        self.id = json["id"].string
        self.name = json["name"].string
    }
    
    func addExtraInformation(json: JSON) {
        self.genre = json["genre"].string
        self.country = json["country"].string
        self.country_flag = json["country_flag"].URL
        self.website = json["website"].string
        self.urlImage = json["image"].URL
    }
    */
    
}
