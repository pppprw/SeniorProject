//
//  MapViewController.swift
//  senior
//
//  Created by \ \ ' on 5/4/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UISearchBarDelegate, MKMapViewDelegate, CLLocationManagerDelegate, UIGestureRecognizerDelegate {

    @IBAction func searchButton(_ sender: Any) {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
    }
    
    @IBOutlet weak var searchsearch: UIButton!
    @IBOutlet weak var myMapView: MKMapView!
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        // Ignoring user
        UIApplication.shared.beginIgnoringInteractionEvents()
        //Activity Indicator
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        self.view.addSubview(activityIndicator)
        
        //Hide search bar
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        //Create the search request
        let searchRequest = MKLocalSearchRequest()
        searchRequest.naturalLanguageQuery = searchBar.text
        
        let activeSearch = MKLocalSearch(request: searchRequest)
        activeSearch.start { (response, error) in
            
            activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            
            
            if response == nil{ print("ERROR")
            }else{
                
                let annotations = self.myMapView.annotations
                self.myMapView.removeAnnotations(annotations)
                
                //getting data
                let latitude = response?.boundingRegion.center.latitude
                let longtitude = response?.boundingRegion.center.longitude
                
                //create annotation
                let annotation = MKPointAnnotation()
                annotation.title = searchBar.text
                annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longtitude!)
                self.myMapView.addAnnotation(annotation)
                
                //Zooming in on annotation
                let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude!, longitude: longtitude!)
                let span = MKCoordinateSpanMake(0.008, 0.008)
                let region = MKCoordinateRegionMake(coordinate, span)
                self.myMapView.setRegion(region, animated: true)
                
                let nameOfDestination = searchBar.text as! String
                
                if (annotation.title != nil){
                    print(nameOfDestination)
                    print("OK")
                }
            }
        }
    }
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchsearch.layer.masksToBounds = true
        searchsearch.layer.cornerRadius = 30
        
  
    
    }
    
 
}
