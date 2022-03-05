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
    var map: MKMapView
    var decoder: MKGeoJSONDecoder

    init(map: MKMapView) {
        self.map = map
        self.decoder = MKGeoJSONDecoder()
    }
    
    @discardableResult
    public func geoJson(fileName : String) -> Parse{
        let path = Bundle.main.path(forResource: fileName, ofType: nil)
        var overlays: [MKOverlay] = []
        var data: Data = Data()
        do {
            data = try Data(contentsOf: URL(fileURLWithPath: path!), options: NSData.ReadingOptions.mappedIfSafe)
            let objects = try decoder.decode(data)
            for object in objects {
                if let feature = object as? MKGeoJSONFeature {
                    if let polygon = feature.geometry.first as? MKPolygon {
                            polygon.title = "Title of Polygon"
                            overlays.append(polygon)
                    }
                    if let annotation = feature.geometry.first as? MKPointAnnotation{
                        self.map.addAnnotation(annotation)
                    }
                }
            }
        } catch (let error) {
            print(error)
        }
        
        map.addOverlays(overlays)
        return self
    }
}


