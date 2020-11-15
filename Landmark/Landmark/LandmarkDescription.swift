//
//  LandmarkDescription.swift
//  Landmark
//
//  Created by Hoang Viet on 11/9/20.
//  Copyright © 2020 Hoang Viet. All rights reserved.
//

import SwiftUI

struct LandmarkDescription: View {
    var text:String
    var head:String
    var body: some View {
        Text(head)
            .font(.headline)
            .bold()
        Text(text)
            .font(.subheadline)
            .padding()
    }
}

struct LandmarkDescription_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDescription(text: "Hi", head: "hitoo")
    }
}
