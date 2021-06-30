//
//  LocationListView.swift
//  DubDubGrub
//
//  Created by Thomas Prezioso Jr on 6/29/21.
//

import SwiftUI

struct LocationListView: View {
    var body: some View {
        NavigationView() {
            List() {
                ForEach(0..<10) { item in
                    NavigationLink(destination: LocationDetailView()) {
                        LocationCell()
                    }
                }
            }
            .navigationTitle("Grub Spots")
        }
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
    }
}
