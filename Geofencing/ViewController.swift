//
//  ViewController.swift
//  Geofencing
//
//  Created by Brandon Vasquez on 5/17/18.
//  Copyright © 2018 Brandon Vasquez. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
   
    // Allows access to post requests set up in APICalls.swift
     let apiCall = Backend()
    
    // Variable that determines whether or not the user is currently at work (allows them to use the app)
    var userIsWorking: Bool = false
    
    // This is where the geofence gets set up_______________________________________________________________
    let workLocationManager = CLLocationManager()
    
    
    func setSanFranHiveLocation() {
        
        let geofenceCenter = CLLocationCoordinate2DMake(37.7887, -122.4056)
        let geofenceRegion = CLCircularRegion(center: geofenceCenter, radius: 100, identifier: "SF Hive")
        self.workLocationManager.startMonitoring(for: geofenceRegion)
        
    }
    
    
    // Determines where the user is in relation to the geofence region, and performs code based on the result
    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
        switch state{
        case .inside:
            print("you're in the region")
            userIsWorking = true
            apiCall.unmuteNotifications()
            
        case .outside:
            print("you're outside of the region")
            userIsWorking = false
            apiCall.muteNotifications()
            performSegue(withIdentifier: "NotificationToggle", sender: nil)
            
        case .unknown:
            print("We don't know where you are. Sneaky. I like it")
            userIsWorking = false
            apiCall.muteNotifications()
        }
    }
    
    
    
    
    // If error occurs, these functions tell us where it happened. Automatically sets userisworking to false.
    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        userIsWorking = false
        print("someting went wrong with the monitoring")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        userIsWorking = false
        print("something went wrong with the location manager")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        workLocationManager.delegate = self
        workLocationManager.requestAlwaysAuthorization()
        setSanFranHiveLocation()
        workLocationManager.startUpdatingLocation()
    
        
    }
    
    @IBAction func unwindToStart(unwindSegue: UIStoryboardSegue) {
        
    }
    
   

}

