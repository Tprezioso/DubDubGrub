//
//  LocationManager.swift
//  DubDubGrub
//
//  Created by Thomas Prezioso Jr on 7/9/21.
//

import Foundation

final class LocationManager: ObservableObject {
    @Published var locations: [DDGLocation] = []
}
