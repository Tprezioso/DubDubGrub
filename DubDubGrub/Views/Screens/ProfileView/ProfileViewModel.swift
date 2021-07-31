//
//  ProfileViewModel.swift
//  DubDubGrub
//
//  Created by Thomas Prezioso Jr on 7/27/21.
//

import SwiftUI
import CloudKit

final class ProfileViewModel: ObservableObject {
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var companyName = ""
    @Published var bio = ""
    @Published var avatar = PlaceholderImage.avatar
    @Published var isShowingPhotoPicker = false
    @Published var alertItem: AlertItem?
    
    func isValidProfile() -> Bool {
        guard !firstName.isEmpty,
              !lastName.isEmpty,
              !companyName.isEmpty,
              !bio.isEmpty,
              avatar != PlaceholderImage.avatar,
              bio.count <= 100 else { return false }
        return true
    }
    
    func getProfile() {
        guard let userRecord = CloudKitManager.shared.userRecord else {
            // Show alert
            return
        }
        guard let profileReference = userRecord["userProfile"] as? CKRecord.Reference else {
            return
        }
        let profileRecordID = profileReference.recordID
        
        CloudKitManager.shared.fetchRecord(with: profileRecordID) { result in
            DispatchQueue.main.async { [self] in
                switch result {
                case .success(let record):
                    let profile = DDGProfile(record: record)
                    firstName = profile.firstName
                    lastName = profile.lastName
                    companyName = profile.companyName
                    avatar = profile.createAvatarImage()
                    bio = profile.bio
                case .failure(_):
                    // Show Alert
                    break
                }
            }
        }
    }
    
    func createProfile() {
        guard isValidProfile() else {
            alertItem = AlertContext.invalidProfile
            return
        }
        
        let profileRecord = createProfileRecord()
        guard let userRecord = CloudKitManager.shared.userRecord else {
            // Show alert
            return
        }
        userRecord["userProfile"] = CKRecord.Reference(recordID: profileRecord.recordID, action: .none)
        CloudKitManager.shared.batchSave(records: [userRecord, profileRecord]) { result in
            switch result {
            case .success(_):
                // Show alert
                break
            case .failure(_):
                // Show alert
                break
            }
        }
    }
    
    
    private func createProfileRecord() -> CKRecord {
        // Create CKRecord from ProfileView
        let profileRecord = CKRecord(recordType: RecordType.profile)
        profileRecord[DDGProfile.kFirstName] = firstName
        profileRecord[DDGProfile.kLastName] = lastName
        profileRecord[DDGProfile.kCompanyName] = companyName
        profileRecord[DDGProfile.kBio] = bio
        profileRecord[DDGProfile.kAvatar] = avatar.convertToCKAsset()
        
        return profileRecord
    }
}
