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

class ViewController: UIViewController {
    
    @IBOutlet weak var mainView: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        let geotracer = GeoTracer()
        
    }
}

extension ViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {

        if let polygon = overlay as? MKPolygon {

            let renderer = MKPolygonRenderer(polygon: polygon)

            renderer.fillColor = .red

            renderer.strokeColor = .black

            renderer.lineWidth = 1

            renderer.alpha = 1.0

            return renderer

        }

        else if let multiPolygon = overlay as? MKMultiPolygon {

            let renderer = MKMultiPolygonRenderer(multiPolygon: multiPolygon)

            renderer.fillColor = .red

            renderer.strokeColor = .black

            renderer.lineWidth = 1

            renderer.alpha = 1.0

            return renderer

        }

        return MKOverlayRenderer()

    }

}
