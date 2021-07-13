//
//  LocationMapView.swift
//  DubDubGrub
//
//  Created by Thomas Prezioso Jr on 6/29/21.
//

import SwiftUI
import MapKit

struct LocationMapView: View {
    @StateObject private var viewModel = LocationMapViewModel()
    @EnvironmentObject private var locationManager: LocationManager
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems:locationManager.locations) { location in
                MapMarker(coordinate: location.location.coordinate , tint: .brandPrimary)
            }
            .accentColor(.grubRed)
            .ignoresSafeArea()
            VStack {
                LogoView(frameWidth: 125)
                    .shadow(radius: 10)
                Spacer()
            }
        }
        .alert(item: $viewModel.alertItem, content: { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        })
        .onAppear {
            viewModel.checkIfLocationServicesIsEnabled()
            
            if locationManager.locations.isEmpty {
                viewModel.getLocations(for: locationManager)
            }
        }
    }
}

struct LocationMapView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapView()
    }
}

