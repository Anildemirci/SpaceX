//
//  DetailsViewController.swift
//  SpaceX
//
//  Created by Anıl Demirci on 5.07.2022.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {

    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var missionName: UILabel!
    @IBOutlet weak var year: UILabel!
    var chosenName=""
    var chosenYear=""
    var chosenImage=""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title="Details"
        missionName.text=("Mission Name : \(chosenName)")
        year.text=("Launch Year : \(chosenYear)")
        let url = URL(string: chosenImage)
        images.kf.setImage(with: url)
    }
    


}
