//
//  DetailViewController.swift
//  IsobarApp
//
//  Created by Humberto Vieira on 23/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import UIKit
import SVProgressHUD
import JDStatusBarNotification

class DetailViewController: UIViewController, BandServiceProtocol {
    @IBOutlet weak var imageViewImage: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelGenre: UILabel!
    @IBOutlet weak var labelCountry: UILabel!
    @IBOutlet weak var labelWebsite: UILabel!
    
    var band: Band!
    let service = BandService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.alpha = 0.7
        SVProgressHUD.show()
        
        service.delegate = self
        service.getExtraInformation(band: band)
    }
    
    
    func finishGetExtraInformation(band: Band) {
        self.band = band
        self.labelName.text = band.name
        self.labelGenre.text = band.genre
        self.labelCountry.text = band.country
        self.labelWebsite.text = band.website
        
        DispatchQueue.main.async {
            if let data = band.imageData {
                self.imageViewImage.image = UIImage(data: data)
            } else {
                self.imageViewImage.image = UIImage(named: "testeImage")
            }
            
            SVProgressHUD.dismiss()
            self.view.alpha = 1
            
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
