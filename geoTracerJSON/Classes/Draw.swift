//
//  Draw.swift
//  geoTracerJSON
//
//  Created by Ludovic FAVIER on 13/01/2022.
//

import Foundation

private class Draw {
    var map: MKMapView
    
    init(map: MKMapView) {
        self.map = map
    }
    
    func square() -> Draw{
        return self
    }
    func circle() -> Draw{
        return self
    }
    func point() -> Draw{
        return self
    }
}
