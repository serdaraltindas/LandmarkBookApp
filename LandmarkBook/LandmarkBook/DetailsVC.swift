//
//  DetailsVC.swift
//  LandmarkBook
//
//  Created by Serdar Altındaş on 9.03.2023.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myLabel.text = selectedLandmarkName
        imageView.image = selectedLandmarkImage
        
        
    }

 
}
