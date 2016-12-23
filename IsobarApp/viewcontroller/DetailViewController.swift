//
//  DetailViewController.swift
//  IsobarApp
//
//  Created by Humberto Vieira on 23/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, BandServiceProtocol {
    var band: Band!
    let service = BandService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.delegate = self
        service.getExtraInformation(band: band)
    }
    
    func finishGetExtraInformation() {
        print(band.website)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
