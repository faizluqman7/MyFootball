//
//  Landmarks.swift
//  MyFootball
//
//  Created by Faiz Luqman on 19/12/2020.
//

import Foundation
import MapKit

struct Landmark {
    let placemark: MKPlacemark
    
    var id: UUID {
        return UUID()
    }
    
    var name: String {
        self.placemark.name ?? ""
    }
    
    var title: String {
        self.placemark.title ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D {
        self.placemark.coordinate
    }
}
