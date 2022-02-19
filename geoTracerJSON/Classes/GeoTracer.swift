import Foundation
import UIKit
import MapKit

public class GeoTracer: MKMapView, MKMapViewDelegate{
    public var map: MKMapView
    public var parse: Parse
    public var draw: Draw
    
    public init (map: MKMapView){
        self.map = map
        self.parse = Parse(map: map)
        self.draw = Draw(map: map)
        
        super.init(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000))
        self.map.delegate = self
        
        
    }
    
    
    //RIP
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let circleRenderer = MKCircleRenderer(overlay: overlay)
            circleRenderer.strokeColor = UIColor.red
            circleRenderer.lineWidth = 1.0
            return circleRenderer
        }}
