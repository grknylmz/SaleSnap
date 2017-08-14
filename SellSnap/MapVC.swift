//
//  MapVC.swift
//  SellSnap
//
//  Created by Gurkan Yilmaz on 13/08/2017.
//  Copyright © 2017 Gurkan Yilmaz. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var map: MKMapView!
    var locationManager: CLLocationManager!
            let kanyonAnnotation = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map.delegate = self
        locationManager = CLLocationManager()
        locationManager.delegate = self
        prepareLocationManager(map: map, locationManager: locationManager)
        createMarker()

    }
    
    func prepareLocationManager(map : MKMapView , locationManager : CLLocationManager){
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
        else {
            if CLLocationManager.locationServicesEnabled() {
                locationManager.requestAlwaysAuthorization()
                locationManager.requestWhenInUseAuthorization()
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                locationManager.startUpdatingLocation()
                map.showsUserLocation = true
                map.userTrackingMode = .follow
            }
        }
    
    }
    
    //Dummy Kanyon AVM Magaza
    func createMarker(){

        kanyonAnnotation.title = "Kanyon Magaza"
        kanyonAnnotation.coordinate = CLLocationCoordinate2D(latitude: 41.0782550, longitude: 29.0116350)
        map.addAnnotation(kanyonAnnotation)
        map.selectAnnotation(map.annotations[0], animated: false)
        
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        getDirections()
    }
    
    func getDirections(){
        
        let destLocation = kanyonAnnotation.coordinate
        let currentLocation = locationManager.location?.coordinate
        
        let sourcePlacemark = MKPlacemark(coordinate: currentLocation!, addressDictionary: nil)
        let destinationPlacemark = MKPlacemark(coordinate: destLocation, addressDictionary: nil)
        
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        
        let directionRequest = MKDirectionsRequest()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .walking
        
        let directions = MKDirections(request: directionRequest)

        directions.calculate {
            (response, error) -> Void in
            
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                
                return
            }
            
            let route = response.routes[0]
            self.map.add((route.polyline), level: MKOverlayLevel.aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.map.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
        }
    
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.red
        renderer.lineWidth = 4.0
        
        return renderer
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
}
