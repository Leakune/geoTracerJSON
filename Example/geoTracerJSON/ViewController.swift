//
//  ViewController.swift
//  geoTracerJSON
//
//  Created by Leakune on 01/07/2022.
//  Copyright (c) 2022 Leakune. All rights reserved.
//
import geoTracerJSON
import MapKit


public class ViewController: UIViewController {
    
    @IBOutlet weak public var mapView: MKMapView!
    public override func viewDidLoad() {
            super.viewDidLoad()
            let geotracer = GeoTracer(map: mapView)
            self.mapView.delegate = geotracer

            let style = Style(lineWidth:2, lineColor: UIColor.blue, fillOpacity: 0.2)
            let style2 = Style(lineWidth:3, lineColor: UIColor.green, fillOpacity: 0.6)

            let coordC = Coordinate(long: 2.333541, lat: 48.655760)
        
            let coordR1 = Coordinate(long: 2.333541, lat: 48.655760)
            let coordR2 = Coordinate(long: 3.333541, lat: 49.655760)

            geotracer.setStyle(style: style).draw.circle(coord: coordC, rad: 300000.0).rectangle(topLeft: coordR1, botRight: coordR2)
        
            let coordPl1 = Coordinate(long: 2.333541, lat: 48.655760)
            let coordPl2 = Coordinate(long: 3.333541, lat: 49.655760)
            let coordPl3 = Coordinate(long: 5.333541, lat: 48.655760)
        
            geotracer.setStyle(style: style2).draw.polyline(coords: [coordPl1, coordPl2, coordPl3])
        
            let coordL1 = Coordinate(long: 1, lat: 45)
            let coordL2 = Coordinate(long: 2, lat: 48)
        
            geotracer.draw.line(p1: coordL1, p2: coordL2)
        
            geotracer.setStyle(style: style2).parse.geoJson(fileName: "polygon.json").geoJson(fileName: "point.json")
        }
}

