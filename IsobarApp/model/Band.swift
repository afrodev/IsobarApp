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
    // MARK: Variaveis
    dynamic var id: String!
    dynamic var name: String!
    dynamic var genre: String!
    dynamic var urlImage: String!
    dynamic var country: String!
    dynamic var country_flag: String!
    dynamic var website: String!
    dynamic var imageData: Data!
    
    // MARK:  Método que obrigatório do Realm
    required convenience init?(map: Map) {
        self.init()
    }
    
    // MARK: Função obrigatória que mapeia o json para um objeto de classe
    func mapping(map: Map) {
        self.id <- map["id"]
        self.name <- map["name"]
        self.genre <- map["genre"]
        self.country <- map["country"]
        self.country_flag <- map["country_flag"]
        self.website <- map["website"]
        self.urlImage <- map["image"]
    }
    
    override static func primaryKey() -> String? {
        return "name"
    }
    
    // MARK: Salva o objeto mapeado no Realm
    func save() {
        let realm = try! Realm()
        
        do {
            // MARK: Transforma Data em UIImage
            if let url = URL(string: self.urlImage) {
                print(url)
                let imageData = try Data(contentsOf: url)
                self.imageData = imageData
            }
        } catch {
            self.imageData = nil
            print("erro imagem model")
        }
        
        try! realm.write {
            realm.add(self, update: true)
        }
    }
}
