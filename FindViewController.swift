//
//  FindViewController.swift
//  ISMOriginalWork
//
//  Created by Gauri Pala on 11/25/20.
//  Copyright © 2020 Gauri Pala. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class FindViewController: UIViewController{
    
    // MARK: - Properties
    
    var locationManager: CLLocationManager!
    //var mapView: MKMapView!
    @IBOutlet weak var mapView: MKMapView!
    

    
    let centerMapButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "location-arrow-flat").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleCenterLocation), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLocationManager()
        configureMapView()
        enableLocationServices()
    }
    
    // MARK: - Selectors
    
    @objc func handleCenterLocation() {
        centerMapOnUserLocation()
        centerMapButton.alpha = 0
    }
    
    // MARK: - Helper Functions
    
    func configureLocationManager() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
    }
    
    func configureMapView() {
        //mapView = MKMapView()
        //mapView.showsUserLocation = true
        mapView.delegate = self
        mapView.userTrackingMode = .follow
        mapView.layer.cornerRadius = 20
        
        //this is to add view programatically!!
//        view.addSubview(mapView)
//        mapView.frame = view.frame
        
        view.addSubview(centerMapButton)
        centerMapButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90).isActive = true
        centerMapButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        centerMapButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        centerMapButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        centerMapButton.layer.cornerRadius = 50 / 2
        centerMapButton.alpha = 0
        
    }
    
    func centerMapOnUserLocation() {
        getNearbyPlaces()
        guard let coordinate = locationManager.location?.coordinate else { return }
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 7000, longitudinalMeters: 7000)
        mapView.setRegion(region, animated: true)
    }
    
    func getNearbyPlaces(){
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = "waste"

        // Set the region to an associated map view's region.
        guard let coordinate = locationManager.location?.coordinate else { return }
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
        searchRequest.region = region
        
        let search = MKLocalSearch(request: searchRequest)
        search.start { (response, error) in
            guard let response = response else { return }
            
            for item in response.mapItems {
                let annotation = MKPointAnnotation()
                annotation.coordinate = item.placemark.coordinate
                annotation.title = item.name
                annotation.subtitle = item.phoneNumber
                
                
                DispatchQueue.main.async {
                    self.mapView.addAnnotation(annotation)
                }
            }
        }
        
    }
}

// MARK: - MKMapViewDelegate

extension FindViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        UIView.animate(withDuration: 0.5) {
            self.centerMapButton.alpha = 1
        }
    }

}

// MARK: - CLLocationManagerDelegate

extension FindViewController: CLLocationManagerDelegate {
    
    func enableLocationServices() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            print("Location auth status is NOT DETERMINED")
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Location auth status is RESTRICTED")
        case .denied:
            print("Location auth status is DENIED")
        case .authorizedAlways:
            print("Location auth status is AUTHORIZED ALWAYS")
        case .authorizedWhenInUse:
            print("Location auth status is AUTHORIZED WHEN IN USE")
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard locationManager.location != nil else { return }
        getNearbyPlaces()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard locationManager.location != nil else { return }
        centerMapOnUserLocation()
        getNearbyPlaces()
    }
}
