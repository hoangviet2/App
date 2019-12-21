//
//  ContentView.swift
//  Landmark
//
//  Created by Hoang Viet on 11/26/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -30)
                .padding(.bottom, -130)
            Spacer()
            VStack(alignment: .leading) {
                Text("Ha Long Bay")
                    .font(.title)
                HStack {
                    Text("Quang Nam")
                        .font(.subheadline)
                    Spacer()
                    Text("Viet Nam")
                        .font(.subheadline)
                }
            }
        .padding()
            
        Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
