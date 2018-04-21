//
//  ExploreViewController.swift
//  senior
//
//  Created by \ \ ' on 24/3/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    
    let top5 = ["bangkok", "seoul", "Explorevancouver", "norway", "sg"]
    let hot = ["yayoi","youth","suntur"]
 
    @IBOutlet weak var top5collectionView: UICollectionView!
    @IBOutlet weak var hotcollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var exploreSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exploreSearchBar.delegate = self
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == top5collectionView){
            return top5.count
        } else{
            return hot.count
        }
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        // Do some search stuff
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = true
        return true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.exploreSearchBar.endEditing(true)
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.exploreSearchBar.endEditing(true)
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == top5collectionView){
            let topcell:top5CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "topcell", for: indexPath) as! top5CollectionViewCell
            
            topcell.top5image.image = UIImage(named: top5[indexPath.row])
            
            return topcell
        } else {
            let hotcell:HotCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "hotcell", for: indexPath) as! HotCollectionViewCell
            
            hotcell.hotimage.image = UIImage(named: hot[indexPath.row])
            
            return hotcell
        }

    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if (collectionView == top5collectionView){
            performSegue(withIdentifier: "top5segue", sender: self)
//            if indexPath.row == 0{
//
//            }
//            if indexPath.row == 1{
//
//            }
//            if indexPath.row == 2{
//                
//            }
//            if indexPath.row == 3{
//
//            }
//            if indexPath.row == 4{
//
//            }
         
        } else {
            if indexPath.row == 0{
                performSegue(withIdentifier: "yayoisegue", sender: self)
            }
            if indexPath.row == 1{
                performSegue(withIdentifier: "dsegue", sender: self)
            }
            if indexPath.row == 2{
                performSegue(withIdentifier: "suntursegue", sender: self)
            }
        }
    }

}
