//
//  Coordinate.swift
//  geoTracerJSON
//
//  Created by Ludovic FAVIER on 01/03/2022.
//

import Foundation
import MapKit

public class Coordinate{
    var long: Double
    var lat: Double
    
    public init (long : Double, lat: Double) {
        self.lat = lat
        self.long = long
    }
    
    func toCLLocationCoordinate2D () -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.lat, longitude: self.long)
    }
    
}
