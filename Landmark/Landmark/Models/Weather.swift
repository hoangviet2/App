//
//  Weather.swift
//  Landmark
//
//  Created by Hoang Viet on 21/11/2020.
//  Copyright © 2020 Hoang Viet. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Weather: Hashable, Codable, Identifiable {
    fileprivate var coordinates: coord
    fileprivate var weather:weathers
    fileprivate var main:main
    var base: String
    var visibility: Int
    var dt: Int
    var id:Int
    var name:String
    var cod:Int
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.lon,
            longitude: coordinates.lat)
    }
}
struct sys: Hashable, Codable {
    var type:Int
    var id:Int
    var message:Double
    var country:String
    var sunrise:Int
    var sunset:Int
}
struct clouds: Hashable, Codable {
    var all:Int
}
struct wind: Hashable, Codable {
    var speed:Double
    var deg:Int
}
struct main: Hashable, Codable {
    var temp:Double
    var pressure:Int
    var humidity:Int
    var temp_min:Double
    var temp_max:Double
}
struct weathers: Hashable, Codable {
    var id:Int
    var main:String
    var description:String
    var icon:String
}
struct coord: Hashable, Codable {
    var lon: Double
    var lat: Double
}
