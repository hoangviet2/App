//
//  SectionView.swift
//  Landmark
//
//  Created by Hoang Viet on 20/11/2020.
//  Copyright © 2020 Hoang Viet. All rights reserved.
//

import SwiftUI

struct SectionView: View {
    var beside: [String: [Destination]] {
        Dictionary(
            grouping: landmarkDestination,
            by: {$0.beside.rawValue}
        )
    }
    
    

    
    var body: some View {
        NavigationView{
            List {
                ForEach(beside.keys.sorted(), id: \.self) { key in
                    SectionViewRow(categoryName: key, itemDes: self.beside[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView()
    }
}
