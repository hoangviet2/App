//
//  ItemsView.swift
//  Landmark
//
//  Created by Hoang Viet on 20/11/2020.
//  Copyright © 2020 Hoang Viet. All rights reserved.
//

import SwiftUI

struct ItemsView: View {
    
    @EnvironmentObject var userData: UserData
    var destination: Destination
    @State var currentDate = Date()
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var destinationIndex: Int {
        userData.destination.firstIndex(where: { $0.id == destination.id })!
    }

    var body: some View {
        fullimage(image: destination.image)
            .edgesIgnoringSafeArea(.top)
            .frame(height: UIScreen.screenHeight/3)
        VStack{
            ScrollView(){
                VStack(alignment: .leading){
                    Text(verbatim: destination.name)
                }
                LandmarkDescription(text: destination.description, head: "Thông tin")
            }
        }
    }
}
