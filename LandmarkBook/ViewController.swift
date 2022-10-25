//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Selçuk Arıöz on 25.10.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var landmarkImage = [UIImage]()
    var landmarkNames = [String]()
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        landmarkNames.append("Colesseum")
        landmarkNames.append("Great Wall")
        landmarkNames.append("La Sagrada Familia")
        landmarkNames.append("Kremlin Palace")
        landmarkNames.append("Stonehange")
        
        landmarkImage.append(UIImage(named: "collesium.jpg")!)
        landmarkImage.append(UIImage(named: "great wall.jpg")!)
        landmarkImage.append(UIImage(named: "la sagrada familia.jpg")!)
        landmarkImage.append(UIImage(named: "kremlin palace.jpg")!)
        landmarkImage.append(UIImage(named: "stonehange.jpg")!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        // cell.textLabel?.text = "test"
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        //content.secondaryText = "Test"
        cell.contentConfiguration = content
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImage[indexPath.row]
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let destinationVC = segue.destination as! DetailVC
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.landmarkImage.remove(at: indexPath.row)
            self.landmarkNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

