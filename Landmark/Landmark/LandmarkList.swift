//
//  LandmarkList.swift
//  Landmark
//
//  Created by Hoang Viet on 12/21/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        List(landmarkData, id: \.Id) { landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
