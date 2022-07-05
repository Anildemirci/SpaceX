//
//  LaunchTableViewCell.swift
//  SpaceX
//
//  Created by Anıl Demirci on 5.07.2022.
//

import UIKit

class LaunchTableViewCell: UITableViewCell {

    @IBOutlet weak var missionPatchImage: UIImageView!
    @IBOutlet weak var missionName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        missionPatchImage.backgroundColor=UIColor.systemYellow
        missionPatchImage.layer.cornerRadius=30
        missionPatchImage.layer.borderWidth=1
        missionPatchImage.layer.borderColor=UIColor.black.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
