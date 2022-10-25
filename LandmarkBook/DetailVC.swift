//
//  DetailVC.swift
//  LandmarkBook
//
//  Created by Selçuk Arıöz on 25.10.2022.
//

import UIKit

class DetailVC: UIViewController {
    @IBOutlet weak var landmarkLabel: UILabel!
    
    @IBOutlet weak var landmarkImage: UIImageView!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        landmarkLabel.text = selectedLandmarkName
        landmarkImage.image = selectedLandmarkImage
    }
}
