//
//  DubDubGrubApp.swift
//  DubDubGrub
//
//  Created by Thomas Prezioso Jr on 6/29/21.
//

import SwiftUI

@main
struct DubDubGrubApp: App {
    
    let locationManager = LocationManager()
    var body: some Scene {
        WindowGroup {
            AppTabView()
                .environmentObject(locationManager)
        }
    }
}
