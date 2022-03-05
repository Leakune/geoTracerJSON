import Foundation
import UIKit
import MapKit

public class GeoTracer: MKMapView, MKMapViewDelegate{
    public var parse: Parse
    public var draw: Draw
    public var style: Style = Style()

    public init (map: MKMapView ){
        self.parse = Parse(map: map)
        self.draw = Draw(map: map)
        super.init(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setStyle(style:Style) -> GeoTracer{
        self.style = style
        return self
    }
    
    public func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKCircle{
            let circleRenderer = MKCircleRenderer(overlay: overlay)
            circleRenderer.strokeColor = self.style.lineColor.withAlphaComponent(CGFloat(self.style.lineOpacity))
            circleRenderer.lineWidth = CGFloat(self.style.lineWidth)
            circleRenderer.fillColor = self.style.fillColor.withAlphaComponent(CGFloat(self.style.fillOpacity))
            self.style.setDefautStyle()
            return circleRenderer
        }else if overlay is MKPolygon{
            let polygonRenderer = MKPolygonRenderer(overlay: overlay)
            polygonRenderer.strokeColor = self.style.lineColor.withAlphaComponent(CGFloat(self.style.lineOpacity))
            polygonRenderer.lineWidth = CGFloat(self.style.lineWidth)
            polygonRenderer.fillColor = self.style.fillColor.withAlphaComponent(CGFloat(self.style.fillOpacity))
            self.style.setDefautStyle()
            return polygonRenderer
        }else if overlay is MKPolyline{
            let polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = self.style.lineColor.withAlphaComponent(CGFloat(self.style.lineOpacity))
            polylineRenderer.lineWidth = CGFloat(self.style.lineWidth)
            polylineRenderer.fillColor = self.style.fillColor.withAlphaComponent(CGFloat(self.style.fillOpacity))
            self.style.setDefautStyle()
            return polylineRenderer
        }
        else{
            self.style.setDefautStyle()
            return MKOverlayRenderer()
        }
            }
    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }

        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }
        annotationView!.accessibilityLabel = "labelYouWillUseToFindIt"
        annotationView!.isAccessibilityElement = true
        return annotationView
    }
    
}
