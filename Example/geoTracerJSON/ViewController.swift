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
        let geotracer = GeoTracer(map: mapView /*, mapViewController: self*/ )
        let coordinate = CLLocationCoordinate2D(latitude: 48.655760,longitude: 2.333541)
        geotracer.draw.circle(coord: coordinate, rad: 300000.0)
        geotracer.parse.geoJson(fileName: "polygon.json").geoJson(fileName: "point.json")
        self.mapView.delegate = self
        
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKCircle{
            let circleRenderer = MKCircleRenderer(overlay: overlay)
            circleRenderer.strokeColor = UIColor.red
            circleRenderer.lineWidth = 1.0
            return circleRenderer
        }else if overlay is MKPolygon{
            let polygonRenderer = MKPolygonRenderer(overlay: overlay)
            polygonRenderer.strokeColor = UIColor.red
            polygonRenderer.lineWidth = 1.0
            return polygonRenderer

        }
//        else if overlay is MKPointAnnotation{
//            let pointRenderer = MKPointAnnotation()
//            return pointRenderer
//
//        }
        else{
            return MKOverlayRenderer()
        }
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        guard let pin = mapView.dequeueReusableAnnotationView(withIdentifier: "geoPin") else {
            let newPin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "geoPin")
            newPin.canShowCallout = true
            newPin.pinTintColor = .brown
            return newPin
        }
        pin.annotation = annotation // permet de changer le contenu de la pin existant
        return pin
    }


}

