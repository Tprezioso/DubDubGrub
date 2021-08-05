//
//  AlertItem.swift
//  DubDubGrub
//
//  Created by Thomas Prezioso Jr on 7/7/21.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    // MARK: - MapView Errors
    static let unableToGetLocations = AlertItem(title: Text("Locations Error"),
                                                message: Text("Unable to retrieve locations at this time. \nPlease try again"),
                                                dismissButton: .default(Text("Ok")))

    static let locationRestricted = AlertItem(title: Text("Locations Restricted"),
                                                message: Text("Your locations is restricted. This may be do to parental controls"),
                                                dismissButton: .default(Text("Ok")))
    
    static let locationDenied = AlertItem(title: Text("Locations Denied"),
                                                message: Text("Dub Dub Grub does not have permission to access your location. Please go into your phone's Settings > Dub Dub Grub > Location"),
                                                dismissButton: .default(Text("Ok")))

    static let locationDisabled = AlertItem(title: Text("Locations Service Disabled"),
                                                message: Text("Your phone's location services are disabled. Please go into your phone's Settings > Privacy > Location Services"),
                                                dismissButton: .default(Text("Ok")))

    // MARK: - ProfileView Errors
    static let invalidProfile = AlertItem(title: Text("Invalid Profile"),
                                                message: Text("All fields are required as well as a profile picture. Your bio must be < 100 characters. \nPlease try again."),
                                                dismissButton: .default(Text("Ok")))

    static let noUserRecord = AlertItem(title: Text("No User Record"),
                                                message: Text("You must login to your iCloud on your phone in order to utilize Dub Dub Grub's Profile. Please login on your phones setting screen"),
                                                dismissButton: .default(Text("Ok")))

    static let createProfileSuccess = AlertItem(title: Text("Profile Create Successfully"),
                                                message: Text("Your profile has successfully been created"),
                                                dismissButton: .default(Text("Ok")))

    static let createProfileFailure = AlertItem(title: Text("Failed to Create Profile"),
                                                message: Text("We we're unable to create your profile at this time.\nPlease try again later"),
                                                dismissButton: .default(Text("Ok")))

    static let unableToGetProfile = AlertItem(title: Text("Unable to retrieve Profile"),
                                                message: Text("We we're unable to retrieve your profile at this time.\nPlease try again later"),
                                                dismissButton: .default(Text("Ok")))
}
