//
//  PrimaryButton.swift
//  BlocKit
//
//  Created by Rudrank Riyam on 29/03/21.
//

import SwiftUI

public struct PrimaryGradientButton: View {
    private var title: LocalizedStringKey
    private var action: () -> ()
    private var color: Color

    public init(_ title: LocalizedStringKey, _ color: Color, _ action: @escaping () -> Void) {
        self.title = title
        self.color = color
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(.callout)
                .bold()
                .fontWidth(.expanded)
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity)
        }
        .controlSize(.large)
        .buttonStyle(.glassProminent)
        .tint(color)
        .buttonBorderShape(.roundedRectangle(radius: 16))
        .accessibilityLabel(title)
        .accessibilityAddTraits(.isButton)
    }
}

public struct PrimaryButton: View {
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
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity)
        }
        .controlSize(.large)
        .buttonStyle(.glassProminent)
        .buttonBorderShape(.roundedRectangle(radius: 16))
        .accessibilityLabel(title)
        .accessibilityAddTraits(.isButton)
    }
}

#Preview {
    VStack {
        PrimaryButton("Evaluate", {})
        PrimaryGradientButton("Next", .blue, {})
    }
    .padding()
}
