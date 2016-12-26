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
            do {
                if let url = URL(string: band.urlImage) {
                
                    let dataImage = try Data(contentsOf: url)
                    let image = UIImage(data: dataImage)
                    self.imageViewImage.image = image
                
                    SVProgressHUD.dismiss()
                    self.view.alpha = 1
                }
            } catch {
                SVProgressHUD.dismiss()
                JDStatusBarNotification.show(withStatus: "Image can't be imported")
                JDStatusBarNotification.dismiss(after: 3)
                self.view.alpha = 1
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
