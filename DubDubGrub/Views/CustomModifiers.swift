//
//  CustomModifiers.swift
//  DubDubGrub
//
//  Created by Thomas Prezioso Jr on 6/30/21.
//

import SwiftUI

struct ProfileNameText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 32, weight: .bold))
            .lineLimit(1)
            .minimumScaleFactor(0.75)
    }
}
