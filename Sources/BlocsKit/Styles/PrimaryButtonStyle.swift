//
//  PrimaryButtonStyle.swift
//  BlocsKit
//
//  Created by Rudrank Riyam on 29/03/21.
//

import SwiftUI

public struct PrimaryButtonStyle<Background: View>: ButtonStyle {
    private var background: Background
    
    public init(_ background: () -> Background) {
        self.background = background()
    }
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.vertical)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(background)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .padding(.top, 8)
    }
}
