//
//  View+Ext.swift
//  DubDubGrub
//
//  Created by Thomas Prezioso Jr on 6/30/21.
//

import SwiftUI

extension View{
    func profileNameStyle() -> some View {
        self.modifier(ProfileNameText())
    }
}
