import Foundation
import UIKit
import MapKit

//public class GeoTracer<MapViewController: MapViewControllerRepresentable>: MXMapView, ... {
//  public var mapViewController: MapViewController
//
//  init(mapViewController: MapViewController) {
//    self.mapViewController = mapViewController
//    ...
//  }
//
//  ...
//}
public protocol MapViewControllerRepresentable: MKMapViewDelegate{
    var mapView: MKMapView! {get set} //écrire et lire
}

public class GeoTracer<MapViewController: MapViewControllerRepresentable>: MKMapView, MKMapViewDelegate{
    //public var map: MKMapView
    public var parse: Parse
    public var draw: Draw
    public var mapViewController: MapViewControllerRepresentable

    public init (map: MKMapView , mapViewController: MapViewControllerRepresentable){
        //self.map = map
        self.mapViewController = mapViewController
        self.parse = Parse(map: map)
        self.draw = Draw(map: map)
        super.init(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000))
        self.mapViewController.mapView.delegate = self
        
    }

    
    //RIP
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
//    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//            let circleRenderer = MKCircleRenderer(overlay: overlay)
//            circleRenderer.strokeColor = UIColor.red
//            circleRenderer.lineWidth = 1.0
//            return circleRenderer
//        }
    
}
//
extension MapViewControllerRepresentable{

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKCircle{
            let circleRenderer = MKCircleRenderer(overlay: overlay)
            circleRenderer.strokeColor = UIColor.red
            circleRenderer.lineWidth = 1.0
            return circleRenderer
        }else if overlay is MKPolygon{
            let circleRenderer = MKPolygonRenderer(overlay: overlay)
            circleRenderer.strokeColor = UIColor.red
            circleRenderer.lineWidth = 1.0
            return circleRenderer

        }
        else{
            return MKOverlayRenderer()
        }
    }

}
