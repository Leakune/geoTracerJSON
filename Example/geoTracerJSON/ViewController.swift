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


public class ViewController: UIViewController {
//    var mapView: MKMapView
    
    
    @IBOutlet weak public var mapView: MKMapView!
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let geotracer = GeoTracer(map: mapView)
        self.mapView.delegate = geotracer
        
        let style = Style(lineWidth:2, lineColor: UIColor.blue, fillOpacity: 0.2)
        let style2 = Style(lineWidth:3, lineColor: UIColor.green, fillOpacity: 0.6)
        
        geotracer.setStyle(style: style).draw.circle(coord: Coordinate(long: 2.333541, lat: 48.655760), rad: 300000.0)
        //geotracer.draw.rectangle(topLeft: Coordinate(long: 2.333541, lat: 48.655760), botRight: Coordinate(long: 3.333541, lat: 49.655760))
        geotracer.setStyle(style: style2).draw.polyline(coords: [Coordinate(long: 2.333541, lat: 48.655760), Coordinate(long: 3.333541, lat: 49.655760), Coordinate(long: 5.333541, lat: 48.655760)])
        geotracer.draw.line(p1: Coordinate(long: 1, lat: 45), p2: Coordinate(long: 2, lat: 48))
        geotracer.parse.geoJson(fileName: "polygon.json").geoJson(fileName: "point.json")
        geotracer.draw.point(coord: Coordinate(long: 2.333541, lat: 48.655760), title: "Point")
        
        
        
    }
    

}

