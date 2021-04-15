//
//  Landmark.swift
//  Landmark
//
//  Created by Hoang Viet on 12/22/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//


import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var state: String
    var park: String
    var category: Category
    var isFavorite: Bool
    var isFeatured: Bool
    var specificpoint:String
    var specialFood:String
    var favoriteDestination:String
    var description: String
    var city: String
    var code:String

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    enum Category: String, CaseIterable, Codable, Hashable {
        case North = "Bắc"
        case Middle = "Trung"
        case South = "Nam"
    }
}

extension Landmark {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
