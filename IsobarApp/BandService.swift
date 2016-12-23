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


protocol BandServiceProtocol: class {
    func finishGetExtraInformation()
}

class BandService {
    private let strURL = "https://powerful-oasis-33182.herokuapp.com/bands/"
    var delegate: BandServiceProtocol?
    
    func getBandList() -> [Band] {
        guard let path = Bundle.main.path(forResource: "bands", ofType: "json") else {
            return []
        }
        
        var arrayList: [Band] = []
        
        
        guard let jsonData = NSData(contentsOf: URL(fileURLWithPath: path)) else {
            return []
        }
        
        let json = JSON(data: jsonData as Data)
        
        let bands = json["bands"]
        
        for b in bands {
            
            let band = Band(json: b.1)
            arrayList.append(band)
        }
        
        return arrayList
    }

    func getExtraInformation(band: Band!) {
        let newURL = strURL + band.id
        
        Alamofire.request(newURL).responseJSON { (response) in
            guard let data = response.data else {
                return
            }
            
            let json = JSON(data: data)
            
            band.addExtraInformation(json: json)
            
            self.delegate?.finishGetExtraInformation()
        }
        
    }
    
}
