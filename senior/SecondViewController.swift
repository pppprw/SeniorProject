//
//  SecondViewController.swift
//  senior
//
//  Created by \ \ ' on 19/2/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//

import UIKit
import MHPinterestLayout
import SwiftCommonUtils
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage

typealias Dimension = (captionHeight:CGFloat, attachmentHeight:CGFloat)


class SecondViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, MHPinterestLayoutDelegate, UISearchBarDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    var layout = MHPinterestLayout()
    var name2:String?
    var name3:String?
    var desCount: Int = 0
    @IBOutlet weak var navigationTitle: UINavigationItem!
    @IBOutlet weak var homeSearchBar: UISearchBar!
    var ref: DatabaseReference!
    var databaseHandle: DatabaseHandle!
    var destinations:[destination] = []
    
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
        
            print("check second")
            destination.createList(completion: {desList in
                self.destinations.removeAll()
                self.destinations = desList
                self.collectionView.reloadData()
                
                ////// loading
                self.activityIndicator.stopAnimating()
            })
        layout.delegate = self
        layout.headerHeight = 10
        layout.footerHeight = 10
        self.collectionView.collectionViewLayout = layout
        
        navigationItem.hidesBackButton = true
       
        //homeSearchBar.showsCancelButton = true
        homeSearchBar.delegate = self
        
        //////////////   TITLE   //////////////
        if let nameToDisplay = name2{
            print(nameToDisplay)
            self.navigationTitle.title = nameToDisplay
        }

//        DispatchQueue.main.async() {
//            self.collectionView.reloadData()
//        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        // Do some search stuff
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = true
        return true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.homeSearchBar.endEditing(true)
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.homeSearchBar.endEditing(true)
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        /* DispatchQueue.main.async() {
            self.collectionView.reloadData()
        } */
        return destinations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.mydestination = destinations[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let desVC = mainStoryboard.instantiateViewController(withIdentifier: "destViewController") as! destViewController
        ////destination image////
        desVC.image = destinations[indexPath.row].img
        print("check woi kwaiiiiiiii: \(destinations[indexPath.row].title!)")
        desVC.postID = destinations[indexPath.row].pid
        desVC.tripID = destinations[indexPath.row].tid
        self.navigationController?.pushViewController(desVC, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, heightForItemAtIndexPath indexPath: IndexPath) -> CGFloat {
            
            let caption = destinations[indexPath.row].title
            let postedby = destinations[indexPath.row].name
            let itemWidth:CGFloat = layout.cellContentWidth
            
            let captionHeight = caption?
                .computedHeight(atWidth: itemWidth, font: UIFont.systemFont(ofSize: 15))
            let postedbyHeight = postedby?.computedHeight(atWidth: itemWidth, font: UIFont.systemFont(ofSize: 12))
            
            let imageHeight = destinations[indexPath.row].img
                .computedHeight(atWidth: itemWidth)
            
            let yPaddings:CGFloat = 10
        
            return captionHeight! + postedbyHeight! + imageHeight + yPaddings
    }
    
}

