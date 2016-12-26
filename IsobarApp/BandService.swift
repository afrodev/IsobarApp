//
//  BandService.swift
//  IsobarApp
//
//  Created by Humberto Vieira on 23/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import ObjectMapper
import RealmSwift

// Protocolo para retornar as informações de uma banda
protocol BandServiceProtocol: class {
    func finishGetExtraInformation(band: Band)
}

class BandService {
    private let strURL = "https://powerful-oasis-33182.herokuapp.com/bands/"
    var delegate: BandServiceProtocol?
    
    // Lista todas as bandas atráves de um arquivo json
    func getBandList() -> [Band] {
        guard let path = Bundle.main.path(forResource: "bands", ofType: "json") else {
            return []
        }
        
        guard let jsonData = NSData(contentsOf: URL(fileURLWithPath: path)) else {
            return []
        }
        
        let json = JSON(data: jsonData as Data)
        guard let bandsStr = json["bands"].rawString() else {
            return []
        }
        
        guard let list: [Band] = Mapper<Band>().mapArray(JSONString: bandsStr) else {
            return []
        }
        
        return list
    }
    
    // Pega as informações das bandas individualmente através dos IDs e salva no Realm
    func getExtraInformation(band: Band) {
        let newURL = strURL + band.id!
        
        // Faz o request no banco de dados
        Alamofire.request(newURL).responseJSON { (response) in
            guard let data = response.data else {
                return
            }
            
            guard let jsonString = JSON(data: data).rawString() else {
                return
            }
            
            guard let newBand = Mapper<Band>().map(JSONString: jsonString) else {
                return
            }
            
            // Coloca o id na banda que será adicionada no banco de dados
            newBand.id = band.id
            
            // Salva no vanco de dados
            newBand.save()
            
            // Retorna o delegate para atualizar a tela
            self.delegate?.finishGetExtraInformation(band: newBand)
        }
        
        // Caso tenha no Realm a banda, ele retorna pegando do Realm
        DispatchQueue.main.async {
            if let newBand = self.searchRealmObjectBy(name: band.name) {
                self.delegate?.finishGetExtraInformation(band: newBand)
            }
        }
    }
    
    // Verifica se tem o objeto no Realm através do nome
    func searchRealmObjectBy(name: String) -> Band? {
        let realm = try! Realm()
        let band = realm.objects(Band.self).filter("name = %@ AND genre != nil", name).first
        return band
    }
    
}
