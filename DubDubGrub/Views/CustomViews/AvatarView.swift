//
//  AvatarView.swift
//  DubDubGrub
//
//  Created by Thomas Prezioso Jr on 6/30/21.
//

import SwiftUI

struct AvatarView: View {
    var size: CGFloat
    var image: UIImage
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
            .clipShape(Circle())
    }
}


struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(size: 64, image: PlaceholderImage.avatar)
    }
}
