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
    func square() -> Draw{
        return self
    }
    
    @discardableResult
    public func circle(coord: CLLocationCoordinate2D, rad: Double) -> Draw{
        let circle = MKCircle(center: coord, radius: rad)
        self.map.add(circle)
        return self
    }
    
    @discardableResult
    func point() -> Draw{
        return self
    }
}
