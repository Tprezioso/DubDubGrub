//
//  UIImage+Ext.swift
//  DubDubGrub
//
//  Created by Thomas Prezioso Jr on 7/21/21.
//

import CloudKit
import UIKit

extension UIImage {
    func convertToCKAsset() -> CKAsset? {
        // Get base app document directory
        guard let urlPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("Document directory came back nil")
            return nil
        }
        // Append a unique ID to our profile image
        let fileURL = urlPath.appendingPathComponent("selectedAvatarImage")
        // Write image data to the location the address points too
        guard let imageData = jpegData(compressionQuality: 0.25) else { return nil }
        // Create CKAsset with that fileURL
        do {
            try imageData.write(to: fileURL)
            return CKAsset(fileURL: fileURL)
        } catch {
            return nil
        }
    }
}
