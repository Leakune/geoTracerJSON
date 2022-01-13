import Foundation
import UIKit
import MapKit

class GeoTracer {
    var map: MKMapView
    var parse = Parse(map)
    var draw = Draw(map)
    
    init(map: MKMapView) {
        self.map = map
    }
    
}

//var tracer = geoTracer(map: MyMap).parse.geoJson(path: <#T##String#>)
//
//tracer.draw.point().point()
