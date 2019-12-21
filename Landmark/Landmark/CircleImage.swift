//
//  CircleImage.swift
//  Landmark
//
//  Created by Hoang Viet on 11/27/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
            Image("turtlerock")
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white,lineWidth: 3))
        .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
