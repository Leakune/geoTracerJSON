# geoTracerJSON

A package to draw shapes into your instance of MKMapView.

[![CI Status](https://img.shields.io/travis/Leakune/geoTracerJSON.svg?style=flat)](https://travis-ci.org/Leakune/geoTracerJSON)
[![Version](https://img.shields.io/cocoapods/v/geoTracerJSON.svg?style=flat)](https://cocoapods.org/pods/geoTracerJSON)
[![License](https://img.shields.io/cocoapods/l/geoTracerJSON.svg?style=flat)](https://cocoapods.org/pods/geoTracerJSON)
[![Platform](https://img.shields.io/cocoapods/p/geoTracerJSON.svg?style=flat)](https://cocoapods.org/pods/geoTracerJSON)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation

geoTracerJSON is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'geoTracerJSON'
```

## Usages

### Firsts steps
In the viewDidLoad() of your ViewController, create an instance of GeoTracer from geoTracerJSON like this:
```swift
import geoTracerJSON
public class ViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let geotracer = GeoTracer(map: mapView)
    }
}
```
When you want to set the delegate of your instance of MKMapView, set it with the instance of GeoTracer:
```swift
import geoTracerJSON
import MapKit
public class ViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let geotracer = GeoTracer(map: mapView)
        self.mapView.delegate = geotracer
    }
}
```
You are ready to draw shapes in your mapView.

### Drawing shapes
The followings shapes will be located around France of your map

#### Circle
```swift
import geoTracerJSON
import MapKit
public class ViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let geotracer = GeoTracer(map: mapView)
        self.mapView.delegate = geotracer
        geotracer.draw.circle(coord: Coordinate(long: 2.333541, lat: 48.655760), rad: 200000)
    }
}
```

#### Rectangle
```swift
import geoTracerJSON
import MapKit
public class ViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let geotracer = GeoTracer(map: mapView)
        self.mapView.delegate = geotracer

        let coord1 = Coordinate(long: 2.333541, lat: 48.655760)
        let coord2 = Coordinate(long: 3.333541, lat: 49.655760)

        geotracer.draw.rectangle(topLeft: coord1, botRight: coord2)

    }
}
```
#### Polyline
```swift
import geoTracerJSON
import MapKit
public class ViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let geotracer = GeoTracer(map: mapView)
        self.mapView.delegate = geotracer

        let coord1 = Coordinate(long: 2.333541, lat: 48.655760)
        let coord2 = Coordinate(long: 3.333541, lat: 49.655760)
        let coord3 = Coordinate(long: 5.333541, lat: 48.655760)

        geotracer.draw.polyline(coords: [coord1, coord2, coord3])
    }
}
```
#### Polygon
```swift
import geoTracerJSON
import MapKit
public class ViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let geotracer = GeoTracer(map: mapView)
        self.mapView.delegate = geotracer

        let coord1 = Coordinate(long: 2.333541, lat: 48.655760)
        let coord2 = Coordinate(long: 3.333541, lat: 49.655760)
        let coord3 = Coordinate(long: 5.333541, lat: 48.655760)

        geotracer.draw.polygon(coords: [coord1, coord2, coord3])
    }
}
```

#### Line
```swift
import geoTracerJSON
import MapKit
public class ViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let geotracer = GeoTracer(map: mapView)
        self.mapView.delegate = geotracer

        let coord1 = Coordinate(long: 1, lat: 45)
        let coord2 = Coordinate(long: 2, lat: 48)
        
        geotracer.draw.line(p1: coord1, p2: coord2)
    }
}
```

#### Point
```swift
import geoTracerJSON
import MapKit
public class ViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let geotracer = GeoTracer(map: mapView)
        self.mapView.delegate = geotracer

        geotracer.draw.point(coord: Coordinate(long: 2.333541, lat: 48.655760), title: "Point")
    }
}
```

### Importing geoJson files

You can use geoJson files to draw shapes.

For the following geoJson file named polygon.json:
```json
{"type":"FeatureCollection","features":[{"type":"Feature","geometry":{"type":"Polygon","coordinates":[[[2.39007,48.8257],[2.38153,48.82242],[2.38076,48.8217],[2.37361,48.81934],[2.36293,48.81608],[2.35615,48.81598],[2.35239,48.81856],[2.34717,48.8161],[2.33371,48.81677],[2.3319,48.81701],[2.33247,48.81825],[2.30132,48.82513],[2.29219,48.82715],[2.28359,48.8308],[2.27906,48.83249],[2.27542,48.82951],[2.2728,48.82792],[2.26754,48.82779],[2.26722,48.83154],[2.27005,48.83301],[2.2673,48.83466],[2.2628,48.83392],[2.25514,48.83481],[2.25171,48.83882],[2.25123,48.8429],[2.25248,48.84548],[2.25062,48.84555],[2.24237,48.84766],[2.23919,48.85004],[2.22566,48.85302],[2.22422,48.85352],[2.22452,48.85654],[2.22822,48.86518],[2.23174,48.86907],[2.23545,48.87059],[2.24109,48.87243],[2.24569,48.87643],[2.25481,48.87408],[2.25541,48.87426],[2.25847,48.88039],[2.27749,48.87797],[2.27995,48.87857],[2.2809,48.8828],[2.28567,48.88657],[2.29151,48.88948],[2.29505,48.88987],[2.29863,48.89172],[2.30782,48.89606],[2.31246,48.89778],[2.31852,48.89963],[2.31988,48.90046],[2.32063,48.9008],[2.32726,48.90107],[2.34839,48.90153],[2.37029,48.90165],[2.38515,48.90201],[2.38944,48.90115],[2.39033,48.90101],[2.3949,48.89844],[2.39762,48.89458],[2.39844,48.89094],[2.39891,48.88563],[2.4002,48.88383],[2.40409,48.8814],[2.40946,48.8801],[2.41239,48.876],[2.41394,48.87083],[2.41366,48.863],[2.41471,48.85865],[2.41634,48.84924],[2.41574,48.84531],[2.41224,48.83454],[2.4135,48.83372],[2.41734,48.83419],[2.42214,48.83579],[2.42093,48.83933],[2.41953,48.84145],[2.41987,48.84345],[2.42184,48.84444],[2.42453,48.84189],[2.43354,48.84105],[2.43718,48.84089],[2.43796,48.84467],[2.44074,48.84441],[2.44075,48.84596],[2.44653,48.84575],[2.44641,48.84493],[2.45789,48.84349],[2.46226,48.84254],[2.46522,48.84111],[2.46971,48.83658],[2.46896,48.83392],[2.46569,48.83181],[2.46457,48.82766],[2.46618,48.82733],[2.46504,48.82409],[2.46286,48.82018],[2.4627,48.81906],[2.459,48.81724],[2.45333,48.81716],[2.4498,48.81788],[2.44186,48.81795],[2.43746,48.81818],[2.43745,48.81911],[2.43491,48.81967],[2.42923,48.82362],[2.42624,48.82413],[2.41996,48.82408],[2.41652,48.82474],[2.41114,48.82489],[2.4077,48.82635],[2.40493,48.82844],[2.40247,48.82954],[2.39396,48.82743],[2.39007,48.8257]]]},"properties":{"code":"75001","nom":"Paris"}}]}
```
You can use it to draw the perimeter of Paris like this:

```swift
import geoTracerJSON
import MapKit
public class ViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let geotracer = GeoTracer(map: mapView)
        self.mapView.delegate = geotracer

        geotracer.parse.geoJson(fileName: "polygon.json")
    }
}
```

### Stylizing your shapes

You can style your shapes by defining an instance of our class Style and by using the setStyle() function of Geotracer:

```swift
import geoTracerJSON
import MapKit
public class ViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let geotracer = GeoTracer(map: mapView)
        self.mapView.delegate = geotracer

        let style = Style(lineWidth:2, lineColor: UIColor.blue, fillOpacity: 0.2)
        let style2 = Style(lineWidth:3, lineColor: UIColor.green, fillOpacity: 0.6)

        let coord = Coordinate(long: 2.333541, lat: 48.655760)

        geotracer.setStyle(style: style).draw.circle(coord: coord, rad: 300000.0)
        geotracer.setStyle(style: style2).parse.geoJson(fileName: "polygon.json")
    }
}
```

### Pile your shapes !

You can pile different drawings from one instruction:

```swift
import geoTracerJSON
import MapKit
public class ViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let geotracer = GeoTracer(map: mapView)
        self.mapView.delegate = geotracer

        let style = Style(lineWidth:2, lineColor: UIColor.blue, fillOpacity: 0.2)
        let style2 = Style(lineWidth:3, lineColor: UIColor.green, fillOpacity: 0.6)

        let coordC = Coordinate(long: 2.333541, lat: 48.655760)
    
        let coordR1 = Coordinate(long: 2.333541, lat: 48.655760)
        let coordR2 = Coordinate(long: 3.333541, lat: 49.655760)

        geotracer.setStyle(style: style).draw.circle(coord: coordC, rad: 300000.0).rectangle(topLeft: coordR1, botRight: coordR2)
        geotracer.setStyle(style: style2).parse.geoJson(fileName: "polygon.json").geoJson(fileName: "point.json")
    }
}
```

## Authors

Leakune,
Lucc70,
Raph

## License

geoTracerJSON is available under the MIT license. See the LICENSE file for more info.
