//
//  SectionViewRow.swift
//  Landmark
//
//  Created by Hoang Viet on 19/11/2020.
//  Copyright © 2020 Hoang Viet. All rights reserved.
//

import SwiftUI

struct SectionViewRow: View {
    var categoryName: String
    var itemDes: [Destination]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
           // NavigationView{
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(self.itemDes) { destination in
                        NavigationLink(destination: ItemsView(destination: destination)) {
                                    categoryItem(destination: destination)
                        }
                    }
                }
           // }
        }
    }
}

struct categoryItem: View {
    var destination: Destination
    var body: some View {
        VStack(alignment: .leading) {
            destination.image
                .resizable()
                .renderingMode(.original)
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(destination.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
    .padding(.leading, 15)
}


struct SectionViewRow_Previews: PreviewProvider {
    static var previews: some View {
        SectionViewRow(
            categoryName: landmarkDestination[0].beside.rawValue,
            itemDes: Array(landmarkDestination.prefix(4))
        )
    }
}
}
}
