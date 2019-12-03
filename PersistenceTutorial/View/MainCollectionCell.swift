//
//  MainCollectionCell.swift
//  PersistenceTutorial
//
//  Created by Sky on 9/9/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class MainCollectionCell: UICollectionViewCell {
    @IBOutlet weak var mainLabel: UILabel!
    
    var numberString: String! {
        didSet {
            mainLabel.text = numberString
        }
    }
    
    //static - property belongs to class not instance. IE. MainCollectionCell.identifier.
    // If we didn't have static, MainCollectionCell().identifier
    static let identifier = "MainCollectionCell"
}
