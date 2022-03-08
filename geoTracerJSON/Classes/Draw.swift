//
//  Draw.swift
//  geoTracerJSON
//
//  Created by Ludovic FAVIER on 13/01/2022.
//

import Foundation
import MapKit

public class Draw {
    var map: MKMapView
    init(map: MKMapView) {
        self.map = map
    }
    
    @discardableResult
    public func rectangle(topLeft: Coordinate, botRight: Coordinate) -> Draw{
        let pTopLeft = CLLocationCoordinate2D(latitude: topLeft.lat, longitude: topLeft.long)
        let pTopRight = CLLocationCoordinate2D(latitude: topLeft.lat, longitude: botRight.long)
        let pBotLeft = CLLocationCoordinate2D(latitude: botRight.lat, longitude: topLeft.long)
        let pBotRight = CLLocationCoordinate2D(latitude: botRight.lat, longitude: botRight.long)
        let locationCoordinates = [pTopLeft,pTopRight,pBotRight,pBotLeft]

        let polygone = MKPolygon(coordinates: locationCoordinates, count: locationCoordinates.count)
        self.map.add(polygone)
        return self
    }
    
    @discardableResult
    public func polygon(coords: [Coordinate]) -> Draw{
        let coordinates = coords.map { $0.toCLLocationCoordinate2D() }
        let polygone = MKPolygon(coordinates: coordinates, count: coordinates.count)
        self.map.add(polygone)
        return self
    }
    
    @discardableResult
    public func polyline(coords: [Coordinate]) -> Draw{
        let coordinates = coords.map { $0.toCLLocationCoordinate2D() }
        let polyline = MKPolyline(coordinates: coordinates, count: coordinates.count)
        self.map.add(polyline)
        return self
    }
    
    @discardableResult
    public func line(p1: Coordinate, p2: Coordinate) -> Draw{
        let coordinates = [p1.toCLLocationCoordinate2D(), p2.toCLLocationCoordinate2D() ]
        let polyline = MKPolyline(coordinates: coordinates, count: coordinates.count)
        self.map.add(polyline)
        return self
    }
    
    @discardableResult
    public func circle(coord: Coordinate, rad: Double) -> Draw{
        let circle = MKCircle(center: coord.toCLLocationCoordinate2D(), radius: rad)
        self.map.add(circle)
        return self
    }
    
    @discardableResult
    public func point(coord: Coordinate, title : String) -> Draw{
        let point = MKPointAnnotation()
        point.title = title
        point.coordinate = CLLocationCoordinate2D(latitude: coord.lat, longitude: coord.long)
        self.map.addAnnotation(point)
        return self
    }

}


