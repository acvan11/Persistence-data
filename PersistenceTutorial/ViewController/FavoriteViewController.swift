//
//  FavoriteViewController.swift
//  PersistenceTutorial
//
//  Created by Sky on 9/9/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    @IBOutlet 

}


extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberofRowsInSection section: Int) -> Int {
        return coreFacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indextPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CatTableCell.identifier, for: indextPath) as! CatTableCell
        let fact = facts[indextPath.row]
        cell.fact = fact
        cell.FAVORITEbUTTON.addTarget(self, action: #selector(favoriteButtonTapped(sender:)), for: .touchUpInside)
        //checking if favorites contains
        cell.FAVORITEbUTTON.tintColor = favorites.contains(fact) ? UIColor.gold : UIColor.lightGray
        cell.favorite
        return cell
    }
}

extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // will only
}
