//
//  fullimage.swift
//  Landmark
//
//  Created by Hoang Viet on 21/11/2020.
//  Copyright © 2020 Hoang Viet. All rights reserved.
//

import SwiftUI

struct fullimage: View {
    @GestureState private var isDetectingPress = false
    var image:Image
    
    var body: some View {
        image
            .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/5, alignment: .top)
    }
}
