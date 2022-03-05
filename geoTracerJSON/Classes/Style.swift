//
//  Style.swift
//  geoTracerJSON
//
//  Created by Ludovic FAVIER on 03/03/2022.
//

import Foundation

public class Style {
    var lineWidth: Float
    var lineColor: UIColor
    var lineOpacity: Float
    
    var fillColor: UIColor
    var fillOpacity: Float
    
    var description: String{
        return "lineWidth: \(lineWidth), lineColor: \(lineColor), lineOpacity: \(lineOpacity), fillColor: \(fillColor), fillOpacity: \(fillOpacity)"
    }
    
    
    public init(lineWidth: Float = 1.0, lineColor: UIColor = UIColor.red, lineOpacity: Float = 1.0, fillColor: UIColor = UIColor.red, fillOpacity: Float = 0.0){
        self.lineWidth = lineWidth
        self.lineColor = lineColor
        self.lineOpacity = lineOpacity
        self.fillColor = fillColor
        self.fillOpacity = fillOpacity
    }
    
    public func setDefautStyle(){
        self.lineWidth = 1.0
        self.lineColor = UIColor.red
        self.lineOpacity = 1.0
        self.fillColor = UIColor.red
        self.fillOpacity = 0.0
    }
}
