//
//  RocketListCollectionViewCell.swift
//  SpaceXApp
//
//  Created by Pınar Macit on 5.10.2022.
//

import UIKit
import Kingfisher

class RocketListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var rocketImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rocketNameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configuration(result:SpaceXElement) {
        rocketImage.kf.setImage(with: URL(string: result.links?.patch?.small ?? ""))
        nameLabel.text = result.name
        rocketNameLabel.text = result.rocket
        yearLabel.text = result.id
        
    }
   
}
