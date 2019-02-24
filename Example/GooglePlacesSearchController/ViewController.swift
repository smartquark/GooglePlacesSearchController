//
//  ViewController.swift
//  GooglePlacesSearchController
//
//  Created by Dmitry Shmidt on 6/28/15.
//  Copyright (c) 2015 Dmitry Shmidt. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import GooglePlacesSearchController

class ViewController: UIViewController {
    let GoogleMapsAPIServerKey = "AIzaSyAfTQ6aQNYW2Edx_oWYdqqfTQG69801X5g"

    lazy var placesSearchController: GooglePlacesSearchController = {
        let controller = GooglePlacesSearchController(delegate: self,
                                                      apiKey: GoogleMapsAPIServerKey,
                                                      placeType: .address,
            // Optional: coordinate: CLLocationCoordinate2D(latitude: 55.751244, longitude: 37.618423),
            // Optional: radius: 10,
            // Optional: strictBounds: true,
            searchBarPlaceholder: "Start typing..."
            
            
            
        )
        controller.searchBar.isTranslucent = true
        controller.searchBar.barStyle = .black
        controller.searchBar.tintColor = .white
        controller.searchBar.barTintColor = .black
        return controller
    }()

    @IBAction func searchAddress(_ sender: UIBarButtonItem) {
        present(placesSearchController, animated: true, completion: nil)
    }
}

extension ViewController: GooglePlacesAutocompleteViewControllerDelegate {
    func viewController(didAutocompleteWith place: PlaceDetails) {
        print(place.description)
        print("lat: \(String(describing: place.coordinate?.latitude)) lon: \(String(describing: place.coordinate?.longitude))")
        placesSearchController.isActive = false
    }
}
