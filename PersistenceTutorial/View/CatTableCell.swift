//
//  CatTableCell.swift
//  PersistenceTutorial
//
//  Created by Sky on 9/9/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class CatTableCell: UITableViewCell {
    @IBOutlet weak var catMainLabel: UILabel!
    @IBOutlet weak var catSubLabel: UILabel!
     @IBOutlet weak var FAVORITEbUTTON: UIbUTTON!
    
    var cat: Fact! {
        didSet {
            catMainLabel.text = cat.information
            catSubLabel.text = "Upvote: \(fact.upvotes)"
        }
    }

    static let identifier = "CatTableCell"
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let image = .withRenderringMode(.alwaysTemplate)
        favoriteButton.setImage(image, for: .normal)
        favoriteButton.tintColor = UIColor.lightGray
    }
}
