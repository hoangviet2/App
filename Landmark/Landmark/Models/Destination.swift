//
//  Destination.swift
//  Landmark
//
//  Created by Hoang Viet on 19/11/2020.
//  Copyright © 2020 Hoang Viet. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Destination:  Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    var state: String
    var beside: Beside;
    var description: String
    
    enum Beside:String, CaseIterable, Codable, Hashable {
        case QuangNinh = "QNI"
        case DaNang = "DNA"
        case KienGiang = "KGI"
        case LaoCai = "LCA"
        case BinhThuan = "BTH"
        case HaNoi = "HNO"
        case Hue = "TTH"
        case HaiPhong = "HPH"
        case HoChiMinh = "HCM"
    }

}
extension Destination {
    var image: Image {
        ImageStoreJPeg.shared.image(name: imageName)
    }
}

