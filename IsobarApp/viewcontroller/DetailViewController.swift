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
        
        // MARK: Coloca a loading na tela e deixa-a mais escura
        self.view.alpha = 0.5
        SVProgressHUD.show()
        
        service.delegate = self
        service.getExtraInformation(band: band)
    }
    
}
