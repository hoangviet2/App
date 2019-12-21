


//
//  MapalertViewController.swift
//  SearchForPlayer
//
//  Created by Hoang Viet on 7/30/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import UIKit
import MapKit

class MapalertViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mkView: MKMapView!
    var LocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mkView.delegate = self
        LocationManager.delegate = self
        
        mkView.showsUserLocation = true
        
        LocationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        LocationManager.requestWhenInUseAuthorization()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
