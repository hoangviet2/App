//
//  LandmarkDetail.swift
//  Landmark
//
//  Created by Hoang Viet on 12/22/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var userData: UserData
    var landmark: Landmark
    @State var currentDate = Date()
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: UIScreen.screenHeight/3)
            
            CircleImage(image: landmark.image)
                .offset(x: 0, y: -130)
                .padding(.bottom,-200)
            ScrollView(){
                VStack(alignment: .leading) {
                    HStack {
                        Text(verbatim: landmark.name)
                            .font(.title)
                        
                        Button(action: {
                            self.userData.landmarks[self.landmarkIndex]
                                .isFavorite.toggle()
                        }) {
                            if self.userData.landmarks[self.landmarkIndex]
                                .isFavorite {
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color.yellow)
                            } else {
                                Image(systemName: "star")
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }
                    LandmarkDescription(text: landmark.description, head: "Thông tin Chung")
                    LandmarkDescription(text: landmark.specificpoint, head: "Đặc điểm địa hình")
                    LandmarkDescription(text: landmark.specialFood, head: "Đặc sản")
                    LandmarkDescription(text: landmark.favoriteDestination, head: "Điểm du lịch nổi tiếng")
                    VStack(alignment: .leading) {
                        Text("Giờ địa phương")
                            .font(.headline)
                            .bold()
                        Text("\(currentDate)")
                            .onReceive(timer, perform: { input in
                                self.currentDate = input
                            })
                            .font(.subheadline)
                    }
                }
            }
            .padding()
        }
    }
}
extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return LandmarkDetail(landmark: userData.landmarks[0])
            .environmentObject(userData)
    }
}
