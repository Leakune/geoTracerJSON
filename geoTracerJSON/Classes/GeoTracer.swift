import Foundation
import UIKit
import MapKit

public class GeoTracer {
    var map: MKMapView
    var parse: Parse
    var draw: Draw
    
    init(map: MKMapView) {
        self.map = map
        parse = Parse(map: map)
        draw = Draw(map: map)
    }
    
}

//var tracer = geoTracer(map: MyMap).parse.geoJson(path: <#T##String#>)
//
//tracer.draw.point().point()
