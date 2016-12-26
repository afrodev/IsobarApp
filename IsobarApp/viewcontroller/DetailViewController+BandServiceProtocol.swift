//
//  DetailViewController+BandServiceProtocol.swift
//  IsobarApp
//
//  Created by Humberto Vieira on 26/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import Foundation


extension DetailViewController: BandServiceProtocol {
    // MARK: Protocolo obrigatório do BandServiceProtocol
    func finishGetExtraInformation(band: Band) {
        self.band = band
        
        self.labelName.text = band.name
        self.labelGenre.text = band.genre
        self.labelCountry.text = band.country
        self.labelWebsite.text = band.website
        
        DispatchQueue.main.async {
            // MARK: Se existir uma imagem ele coloca na tela, senão deixa a default
            if let data = band.imageData {
                self.imageViewImage.image = UIImage(data: data)
            } else {
                self.imageViewImage.image = UIImage(named: "testeImage")
            }
            
            // MARK: Tira o loading e coloca a tela com o alpha normals
            SVProgressHUD.dismiss()
            self.view.alpha = 1
        }
    }

}
