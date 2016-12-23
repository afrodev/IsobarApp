//
//  Band.swift
//  IsobarApp
//
//  Created by Humberto Vieira on 23/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import Foundation
import SwiftyJSON

class Band {
    var id: String!
    var name: String!
    var genre: String!
    var image: UIImage!
    var country: String!
    var country_flag: String!
    var website: String!
    
    
    
    init(json: JSON) {
        self.id = json["id"].string
        self.name = json["name"].string
    }
    
    func addExtraInformation(json: JSON) {
        self.genre = json["genre"].string
        self.country = json["country"].string
        self.country_flag = json["country_flag"].string
        self.website = json["website"].string
    }
    
    
}
