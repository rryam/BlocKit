//
//  GradientButtonStyle.swift
//  BlocKit
//
//  Created by Rudrank Riyam on 22/03/21.
//

import SwiftUI

public struct GradientButtonStyle: ButtonStyle {
    let primaryGradient = Gradient(colors: [.secondary, .secondary])
    let secondaryGradient = Gradient(colors: [Color(.lightGray), Color(.darkGray)])
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding(.vertical)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(AnimatedGradientView().cornerRadius(Constants.cornerRadius))
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .padding([.top])
    }
}
