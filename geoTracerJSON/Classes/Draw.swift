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
        let pTopLeft = CLLocation(latitude: topLeft.lat, longitude: topLeft.long)
        let pTopRight = CLLocation(latitude: topLeft.lat, longitude: botRight.long)
        let pBotLeft = CLLocation(latitude: botRight.lat, longitude: topLeft.long)
        let pBotRight = CLLocation(latitude: botRight.lat, longitude: botRight.long)
        let locationCoordinates = [pTopLeft,pTopRight,pBotRight,pBotLeft]

        let coordinates = locationCoordinates.map { $0.coordinate }

        let polygone = MKPolygon(coordinates: coordinates, count: coordinates.count)
        self.map.add(polygone)
        return self
    }
    
    @discardableResult
    public func polygon(coords: [Coordinate]) -> Draw{
        let coordinates = coords.map { $0.toCLLocationCoordinate2D() }
        print(coordinates)
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
    public func circle(coord: CLLocationCoordinate2D, rad: Double) -> Draw{
        let circle = MKCircle(center: coord, radius: rad)
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
    
//    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//        if overlay is MKCircle{
//            let circleRenderer = MKCircleRenderer(overlay: overlay)
//            circleRenderer.strokeColor = UIColor.red
//            circleRenderer.lineWidth = 1.0
//            return circleRenderer
//        }else if overlay is MKPolygon{
//            let circleRenderer = MKPolygonRenderer(overlay: overlay)
//            circleRenderer.strokeColor = UIColor.red
//            circleRenderer.lineWidth = 1.0
//            return circleRenderer
//
//        }
//        else{
//            return MKOverlayRenderer()
//        }
//    }
}

//extension UIViewController: MKMapViewDelegate{
//
//    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//        if overlay is MKCircle{
//            let circleRenderer = MKCircleRenderer(overlay: overlay)
//            circleRenderer.strokeColor = UIColor.red
//            circleRenderer.lineWidth = 1.0
//            return circleRenderer
//        }else if overlay is MKPolygon{
//            let circleRenderer = MKPolygonRenderer(overlay: overlay)
//            circleRenderer.strokeColor = UIColor.red
//            circleRenderer.lineWidth = 1.0
//            return circleRenderer
//
//        }
//        else{
//            return MKOverlayRenderer()
//        }
//    }
//
//}

