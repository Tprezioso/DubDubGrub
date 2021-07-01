//
//  DDGLocation.swift
//  DubDubGrub
//
//  Created by Thomas Prezioso Jr on 7/1/21.
//

import CloudKit

struct DDGLocation {
    let ckRecordID: CKRecord.ID
    let name: String
    let description: String
    let squareAsset: CKAsset
    let bannerAsset: CKAsset
    let address: String
    let location: CLLocation
    let websiteURL: String
    let phoneNumber: String
}
