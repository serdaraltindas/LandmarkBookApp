//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Serdar Altındaş on 9.03.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//İLK ADIM OLARAK UIDELEGATE VE UIDATASOURCE EKLEDİK.
    @IBOutlet weak var tableView: UITableView!
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var landmarkSecondNames = [String]()
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        //DAHA SONRA DELEGATE VE DATASOURCE VİEW'LARINI TANIMLADIK.
        tableView.delegate = self
        tableView.dataSource = self
        
        landmarkNames.append("Collesium")
        landmarkNames.append("Great Wall")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Stonehenge")
        landmarkNames.append("Taj Mahal")
        
        landmarkImages.append(UIImage(named: "collesium")!)
        landmarkImages.append(UIImage(named: "greatwall")!)
        landmarkImages.append(UIImage(named: "kremlin")!)
        landmarkImages.append(UIImage(named: "stonhenge")!)
        landmarkImages.append(UIImage(named: "tajmahal")!)

        landmarkSecondNames.append("ITALY")
        landmarkSecondNames.append("CHINA")
        landmarkSecondNames.append("RUSSIA")
        landmarkSecondNames.append("ENGLAND")
        landmarkSecondNames.append("INDIAN")

        
}
    //DAHA SONRA DELEGATE VE DATASOURCE FONKSİYONLARINI YAZDIK.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //DAHA SONRA YENİ OLUŞTURULAN CELL KONSEPTİ İLE BERABER FIRSTTEXT VE SECONDTEXT KISIMLARINI OLUŞTURDUK.
        let cell = UITableViewCell()
        //BU YAPI UNUTULMAMALI!
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        //İNDEXPATH TABLEVİEW ÖZELLİĞİ SAYESİNDE GİRİLEN DEĞERLERİ SIRASI İLE ÇAĞIRIR!
        content.secondaryText = landmarkSecondNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil )
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! DetailsVC
            
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath] , with: UITableView.RowAnimation.fade)
        }
    }
}

