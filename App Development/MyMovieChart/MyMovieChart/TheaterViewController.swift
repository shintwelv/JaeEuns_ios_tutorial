//
//  TheaterViewController.swift
//  MyMovieChart
//
//  Created by ShinIl Heo on 11/4/23.
//

import UIKit
import MapKit

class TheaterViewController: UIViewController {
    
    var param: NSDictionary!
    
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        self.navigationItem.title = self.param["상영관명"] as? String
        
        let lat = (param?["위도"] as! NSString).doubleValue
        let lng = (param?["경도"] as! NSString).doubleValue
        
        let location = CLLocationCoordinate2D(latitude: lat, longitude: lng)

        // 지도에 표현될 거리, 축척 (m)
        let regionRadius: CLLocationDistance = 100 // 1:100
        
        // 지도 데이터 생성
        let coordinateRegion = MKCoordinateRegion(center: location, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        self.map.setRegion(coordinateRegion, animated: true)
        
        let point = MKPointAnnotation()
        point.coordinate = location
        self.map.addAnnotation(point)
    }
}
