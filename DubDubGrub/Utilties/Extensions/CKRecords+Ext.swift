//
//  CKRecors+Ext.swift
//  DubDubGrub
//
//  Created by Thomas Prezioso Jr on 7/5/21.
//

import CloudKit

extension CKRecord {
    func convertToDDGLocation() -> DDGLocation { DDGLocation(record: self) }
    func convertToDDGProfile() -> DDGProfile { DDGProfile(record: self) }
}
