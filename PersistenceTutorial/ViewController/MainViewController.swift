//
//  ViewController.swift
//  PersistenceTutorial
//
//  Created by Sky on 9/9/19.
//  Copyright © 2019 Sky. All rights reserved.
//

// moi add button "star" vao

import UIKit

class MainViewController: UIViewController {

    @IBOutLet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var mainTableView: UITableView!
    
    var facts = [Fact](){
        didSet {
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
                self.mainCollectionView.reloadData()
            }
        }
    }
    
    var favorites = Set<Fact>(
        
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMain()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favorites = Set<Fact>(core.load())
    }
    
    private func setupMain() {
        //unowned vs weak - both do NOT increase retain count - but unowned is NOT an optional. If you use it the property MUST not be nil or it will crash the app
        factService.getFacts { [unowned self] fcts in
            self.facts = fcts
            print("Fact Count: \(fcts.count)")
            
        }
        
        
    }
    
    objc func favoriteButtonTapped(sender: UIButton) {
        //checking the status of our button by color
        let isFavorited = sender.intColor == UIColor.gold
        let fact = facts[sender.tag]
       //running logic, depending on button state
        switch isFavorited {
        case false:
            sender.tintColor = UIColor.gold
            favorites.insert(newMember: fact)
            core.save(fact)
            print("Saved Favorite: \(fact.id)")
        case true:
            sender.tintColor = UIColor.lightGray
            favorites.remove(fact)
            core.delete(fact)
            print("Removed Favorite: \(fact.id)")
        }
    }
    
    

}


//mark: CollectionView
extension MainViewController: UICollectionViewDataSource {
 
    // number of rows to display
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return facts.count
    }
    
    //renders each row
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionCell.identifier, for: IndexPath) as! MainCollectionCell
        cell.numberString = "\(IndexPath.row)"
        return cell
    }
}


extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    //size of each individual cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 3.5 // consitent across multiple screen sizes
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
}


extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberofRowsInSection section: Int) -> Int {
        return facts.count
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

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // will only
    }
}
