//
//  FavoriteTableCell.swift
//  PersistenceTutorial
//
//  Created by Sky on 9/9/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class FavoriteTableCell: UITableViewCell {

    @IBOutlet weak var favoritesMainLabel: UILabel!
    @IBOutlet weak var favoritesSubLabel: UILabel!
    
    satatic let identifier = "FavoriteTableCell"
    
    var coreFact: CoreFact! {
        didSet {
            var cat: Fact! {
                didSet {
                    catMainLabel.text = cat.information
                    catSubLabel.text = "Upvote: \(fact.upvotes)"
                }
            }
        }
    }
}
