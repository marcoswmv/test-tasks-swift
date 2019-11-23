//
//  SensorsViewController.swift
//  TestTask6
//
//  Created by Marcos Vicente on 19.11.2019.
//  Copyright © 2019 Antares Software Group. All rights reserved.
//

import UIKit
import CoreLocation

class SensorsLocationDelegate: NSObject, CLLocationManagerDelegate {
    
    let sensorsViewController = SensorsViewController()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locationCoordinates: CLLocationCoordinate2D = manager.location?.coordinate else { return  }
        sensorsViewController.latitudeGPS.text = "Latitude: \(locationCoordinates.latitude)"
        sensorsViewController.longitudeGPS.text = "longitude: \(locationCoordinates.longitude)"
    }
}
