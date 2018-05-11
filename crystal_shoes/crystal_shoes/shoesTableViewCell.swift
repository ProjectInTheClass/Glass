//
//  shoesTableViewCell.swift
//  crystal_shoes
//
//  Created by 김예지 on 2018. 5. 10..
//  Copyright © 2018년 software_studio1. All rights reserved.
//

import UIKit

class shoesTableViewCell: UITableViewCell {

    @IBOutlet weak var shoesImageView: UIImageView!
    @IBOutlet weak var shoesNameLabel: UILabel!
    @IBOutlet weak var shoesswitch: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var shoesForCell:Shoes? { didSet {
        self.shoesNameLabel.text = shoesForCell?.title
        self.shoesImageView.image = UIImage(named:(shoesForCell?.imageName)!)
        self.shoesswitch.isOn = ((shoesForCell?.brand) != nil)
        }}
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
