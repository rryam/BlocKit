//
//  SecondaryButton.swift
//  BlocKit
//
//  Created by Rudrank Riyam on 13/07/21.
//

import SwiftUI

public struct SecondaryGradientButton: View {
    private var color: Color
    private var title: LocalizedStringKey
    private var action: () -> ()
    private var disabled: Bool

    public init(title: LocalizedStringKey, color: Color, disabled: Bool = false, _ action: @escaping () -> Void) {
        self.title = title
        self.color = color
        self.action = action
        self.disabled = disabled
    }

    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(.callout)
                .bold()
                .fontWidth(.expanded)
                .foregroundStyle(Color.primary)
                .frame(maxWidth: .infinity)
        }
        .controlSize(.large)
        #if os(iOS)
        .buttonStyle(.glass)
        #else
        .buttonStyle(.bordered)
        #endif
        .buttonBorderShape(.roundedRectangle(radius: 16))
        .tint(disabled ? .gray : color)
        .accessibilityLabel(title)
        .accessibilityAddTraits(.isButton)
    }
}

public struct SecondaryButton: View {
    private var title: LocalizedStringKey
    private var action: () -> ()

    public init(_ title: LocalizedStringKey, _ action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(.callout)
                .bold()
                .fontWidth(.expanded)
                .foregroundStyle(Color.primary)
                .frame(maxWidth: .infinity)
        }
        .controlSize(.large)
        #if os(iOS)
        .buttonStyle(.glass)
        #else
        .buttonStyle(.bordered)
        #endif
        .buttonBorderShape(.roundedRectangle(radius: 16))
        .accessibilityLabel(title)
        .accessibilityAddTraits(.isButton)
    }
}

#Preview {
    VStack {
        SecondaryButton("Try Again", {})
        SecondaryGradientButton(title: "Show Score", color: .blue, disabled: false, {})
    }
    .padding()
}
