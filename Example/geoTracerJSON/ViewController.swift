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


class ViewController: UIViewController, MapViewControllerRepresentable {
//    var mapView: MKMapView
    
    
    @IBOutlet weak public var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let geotracer = GeoTracer<ViewController>(map: mapView , mapViewController: self )
        let coordinate = CLLocationCoordinate2D(latitude: 48.655760,longitude: 2.333541)
        geotracer.draw.circle(coord: coordinate, rad: 300000.0)
        //geotracer.draw.rectangle(topLeft: Coordinate(long: 2.333541, lat: 48.655760), botRight: Coordinate(long: 3.333541, lat: 49.655760))
        geotracer.draw.polyline(coords: [Coordinate(long: 2.333541, lat: 48.655760), Coordinate(long: 3.333541, lat: 49.655760), Coordinate(long: 5.333541, lat: 48.655760)])
        geotracer.draw.line(p1: Coordinate(long: 1, lat: 45), p2: Coordinate(long: 2, lat: 48))
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
        }else if overlay is MKPolyline{
            let polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = UIColor.red
            polylineRenderer.lineWidth = 1.0
            return polylineRenderer
        }
        
        else{
            return MKOverlayRenderer()
        }
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }

        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }

        return annotationView
    }

}

