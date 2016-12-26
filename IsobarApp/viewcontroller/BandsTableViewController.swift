//
//  BandsTableViewController.swift
//  IsobarApp
//
//  Created by Humberto Vieira on 23/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import UIKit
import RealmSwift
import SVProgressHUD

class BandsTableViewController: UITableViewController {
    var arrayBands: [Band] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Altera os valores da navigationBar
        self.title = "Bands"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.navigationItem.rightBarButtonItem?.tintColor = .white
        self.navigationItem.backBarButtonItem?.title = ""
    }

    override func viewWillAppear(_ animated: Bool) {
        SVProgressHUD.dismiss()
        
        // Atualiza o serviço pois senão não salva os IDs de cada banda
        let service = BandService()
        let array = service.getBandList()
        arrayBands = array
        
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayBands.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellBand", for: indexPath) as! BandTableViewCell
        
        // Coloca os dados da celula através de um objeto Band
        let band = self.arrayBands[indexPath.row]
        cell.configure(band: band)

        return cell
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Evento de quando a celula é selecionada, ela vai para outra tela mandando o objeto
        let band = arrayBands[indexPath.row]
        self.performSegue(withIdentifier: "segueDetailViewController", sender: band)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //
        if let vc2 = segue.destination as? DetailViewController {
            vc2.band = sender as? Band
        }
    
    }
    

}
