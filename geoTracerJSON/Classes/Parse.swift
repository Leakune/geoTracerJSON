//
//  geojsonParser.swift
//  geoTracerJSON
//
//  Created by Ludovic FAVIER on 13/01/2022.
//

import Foundation

private class Parse {
    var path: String
    var map: MKMapView
    
    init(map: MKMapView) {
        self.map = map
    }
    
    func geoJson(path : String) -> Parse{
        // parse le fichier et dessine le sur la map
        return self
    }
    func xml(path : String){
        // parse le fichier et dessine le sur la map
    }
}

