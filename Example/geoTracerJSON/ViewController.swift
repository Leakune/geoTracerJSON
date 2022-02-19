//
//  ViewController.swift
//  geoTracerJSON
//
//  Created by Leakune on 01/07/2022.
//  Copyright (c) 2022 Leakune. All rights reserved.
//
import Foundation
import UIKit
import geoTracerJSON
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let geotracer = GeoTracer(map: mapView)
        let coordinate = CLLocationCoordinate2D(latitude: 48.655760,longitude: 2.333541)
        geotracer.draw.circle(coord: coordinate, rad: 300000.0)
        mapView.delegate = self
        
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let circleRenderer = MKCircleRenderer(overlay: overlay)
            circleRenderer.strokeColor = UIColor.red
            circleRenderer.lineWidth = 1.0
            return circleRenderer
        }
}


