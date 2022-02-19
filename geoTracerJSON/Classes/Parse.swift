//
//  geojsonParser.swift
//  geoTracerJSON
//
//  Created by Ludovic FAVIER on 13/01/2022.
//

import Foundation
import MapKit
import SwiftUI
import UIKit

public class Parse {
//    var path: String
    var map: MKMapView
    var decoder: MKGeoJSONDecoder

    init(map: MKMapView) {
        self.map = map
        self.decoder = MKGeoJSONDecoder()
    }
    
    @discardableResult
    public func geoJson(fileName : String) -> Parse{
        // parse le fichier et dessine le sur la map
//        let decoded = try decoder.decode(data)
//        return self
        let path = Bundle.main.path(forResource: fileName, ofType: nil)
        var overlays: [MKOverlay] = []
        var data: Data = Data()
        do {
            data = try Data(contentsOf: URL(fileURLWithPath: path!), options: NSData.ReadingOptions.mappedIfSafe)
         } catch {
        }

        do {
            let objects = try decoder.decode(data)
            
            for object in objects {

                            if let feature = object as? MKGeoJSONFeature {

                                if let polygon = feature.geometry.first as? MKPolygon {

                                        polygon.title = "Title of Polygon"

                                        overlays.append(polygon)

                                }

                            }

                        }

        } catch (let error) {

        }
        
        //Parse the objects
//        objects.forEach {(feature) in
//            guard let geometry = feature.geometry.first,
//                  let propData = feature.properties else{
//                      return;
//            }
//            //Check if it is MKPolygon
//            if let polygon = geometry as? MKPolygon{
//                let polygonInfo = try? JSONDecoder.init().decode(PolygonInfo.self, from: propData)
//                self.view?.render (overlay: polygon,
//                                   info: polygonInfo)
//            }
//            //Check if it is MKPolyline
//            if let polyline = geometry as? MKPolyline{
//                let polylineInfo = try? JSONDecoder.init().decode(PolylineInfo.self, from: propData)
//                self.view?.render(overlay: polyline, info: polylineInfo )
//            }
//            //Check if it is MKPointAnnotation
//            if let annotation = geometry as? MKPointAnnotation{
//                let info = try? JSONDecoder.init().decode(Info.self, from: propData)
//                let storeAnnotation = StoreAnnotation.init (title: info?.name, subtitle : info?.subTitle,website: info?.website,coordinate: annotation.coordinate)
//                self.view?.setAnnotations (annotations : [storeAnnotation ])
//            }
        
        map.addOverlays(overlays)
        return self
    }
    func xml(path : String){
        // parse le fichier et dessine le sur la map
    }
}

