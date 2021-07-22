//
//  PhotoPicker.swift
//  DubDubGrub
//
//  Created by Thomas Prezioso Jr on 7/16/21.
//

import SwiftUI

struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var image: UIImage
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(photoPicker: self)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let photoPicker: PhotoPicker
        
        init(photoPicker: PhotoPicker) {
            self.photoPicker = photoPicker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
//                Code below was used for compressing images before doing it in Image extension
//                let compressedImageData = image.jpegData(compressionQuality: 0.1)!
//                                 UIImage(data: compressedImageData)!
                photoPicker.image = image
            }
            photoPicker.presentationMode.wrappedValue.dismiss()
        }
    }
}
