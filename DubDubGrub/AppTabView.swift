//
//  AppTabView.swift
//  DubDubGrub
//
//  Created by Thomas Prezioso Jr on 6/29/21.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
        TabView {
            LocationMapView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }

            LocationListView()
                .tabItem {
                    Label("Locations", systemImage: "building")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
