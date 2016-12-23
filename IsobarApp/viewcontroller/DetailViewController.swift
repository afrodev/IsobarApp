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
    var band: Band!
    let service = BandService()
    @IBOutlet weak var imageViewImage: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelGenre: UILabel!
    @IBOutlet weak var labelCountry: UILabel!
    @IBOutlet weak var labelWebsite: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.alpha = 0.7
        SVProgressHUD.show()
        
        service.delegate = self
        service.getExtraInformation(band: band)
    }
    
    func finishGetExtraInformation() {
        self.labelName.text = band.name
        self.labelGenre.text = band.genre
        self.labelCountry.text = band.country
        self.labelWebsite.text = band.website
        
        DispatchQueue.main.async {
            do {
                let dataImage = try Data(contentsOf: self.band.urlImage)
                let image = UIImage(data: dataImage)
                self.imageViewImage.image = image
                SVProgressHUD.dismiss(withDelay: 0.2)
                self.view.alpha = 1
            } catch {
                SVProgressHUD.dismiss(withDelay: 0.1)
                JDStatusBarNotification.show(withStatus: "Image can't be imported")
                self.view.alpha = 1
            }
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
