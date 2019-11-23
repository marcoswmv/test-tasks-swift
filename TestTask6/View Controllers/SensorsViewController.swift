//
//  SensorsViewController.swift
//  TestTask6
//
//  Created by Marcos Vicente on 19.11.2019.
//  Copyright © 2019 Antares Software Group. All rights reserved.
//

import UIKit
import CoreMotion
import CoreLocation

class SensorsViewController: UIViewController {

    @IBOutlet weak var xAccelerometer: UILabel!
    @IBOutlet weak var yAccelerometer: UILabel!
    @IBOutlet weak var zAccelerometer: UILabel!
    @IBOutlet weak var latitudeGPS: UILabel!
    @IBOutlet weak var longitudeGPS: UILabel!
    
    let motion = CMMotionManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getAccelerometerValues()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.locationManager.requestAlwaysAuthorization()
        
        setupLocationManager()
    }
    
    func setupLocationManager() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    func getAccelerometerValues() {
        motion.accelerometerUpdateInterval = 0.5
        motion.startAccelerometerUpdates(to: OperationQueue.current!) { (result, error) in
            if let errorToCatch = error {
                print(errorToCatch.localizedDescription)
            } else if let accelerometerData = result {
                self.view.reloadInputViews()
                let x = accelerometerData.acceleration.x
                let y = accelerometerData.acceleration.y
                let z = accelerometerData.acceleration.z
                
                self.xAccelerometer.text = "X: \(Double(x).rounded(toPlaces: 3))"
                self.yAccelerometer.text = "Y: \(Double(y).rounded(toPlaces: 3))"
                self.zAccelerometer.text = "Z: \(Double(z).rounded(toPlaces: 3))"
            }
        }
    }
}

extension SensorsViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locationCoordinates: CLLocationCoordinate2D = manager.location?.coordinate else { return  }
        self.latitudeGPS.text = "\(NSLocalizedString("Latitude", comment: "Latitude label")): \(locationCoordinates.latitude.rounded(toPlaces: 4))"
        self.longitudeGPS.text = "\(NSLocalizedString("Longitude", comment: "Longitude label")): \(locationCoordinates.longitude.rounded(toPlaces: 4))"
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
        case.authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            break
        default:
            break
        }
    }
}
