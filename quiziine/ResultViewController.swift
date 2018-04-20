//
//  ResultViewController.swift
//  quiziine
//
//  Created by Sheldon Lynn on 2018-04-19.
//  Copyright © 2018 Sheldon Lynn. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation
import SwiftyJSON
import MapKit

class ResultViewController: UIViewController, CLLocationManagerDelegate {
    var foodType: String?
    var result: JSON?
    let locationManager = CLLocationManager()
    var location: CLLocationCoordinate2D?
    let restAnnotation = MKPointAnnotation()

//    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBAction func returnHome(_ sender: Any) {
        performSegue(withIdentifier: "ShowHomeFromResult", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up core location
        locationManager.requestWhenInUseAuthorization()
        
        // If location services is enabled get the users location
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest // You can change the locaiton accuary here.
            locationManager.startUpdatingLocation()
        }
    }
    
    func getPlace(cuisine: String, location: CLLocationCoordinate2D) {
        let sv = UIViewController.displaySpinner(onView: self.view)
        var url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=AIzaSyAusDburPBCAa473e-6YT_sHs-AJ7ESWNE&location=\(location.latitude),\(location.longitude)&type=restaurant&radius=3000"
        
        if cuisine != "" {
            url += "&keyword=\(cuisine)"
        }

        Alamofire.request(url).responseJSON { response in
            if let data = response.data {
                if let json = try? JSON(data: data) {
                    self.result = json["results"][0]
                    print(self.result)
                    UIViewController.removeSpinner(spinner: sv)
                    self.setUpView()
                }
            }
        }
    }
    
    func setUpView() {
        let latitude = self.result!["geometry"]["location"]["lat"].doubleValue
        let longitude = self.result!["geometry"]["location"]["lng"].doubleValue
        let restName = self.result!["name"].stringValue
        let restAddress = self.result!["vicinity"].stringValue
        
        nameLabel.text = restName
        addressLabel.text = restAddress
        
        print("latitude: \(latitude)")
        print("longitude: \(longitude)")
        
        restAnnotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        restAnnotation.title = restName
        mapView.addAnnotation(restAnnotation)
        
        mapView.showAnnotations(mapView.annotations, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Print out the location to the console
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            if (self.location != nil) { return }

            self.location = location.coordinate
            
            getPlace(cuisine: foodType!, location: location.coordinate)
        }
    }
    
    // If we have been denied access give the user the option to change it
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == CLAuthorizationStatus.denied) {
            showLocationDisabledPopUp()
        }
    }
    
    // Show the popup to the user if we have been deined access
    func showLocationDisabledPopUp() {
        let alertController = UIAlertController(title: "Background Location Access Disabled",
                                                message: "In order to quiziine, we need to know where you are located",
                                                preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
            if let url = URL(string: UIApplicationOpenSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(openAction)
        
        self.present(alertController, animated: true, completion: nil)
    }

}
