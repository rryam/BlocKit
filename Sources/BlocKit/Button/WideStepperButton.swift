//
//  WideStepperButton.swift
//  BlocKit
//
//  Created by Rudrank Riyam on 10/07/21.
//

import SwiftUI

public enum StepperButtonImage: String, Sendable {
    case plus
    case minus
}

public struct WideStepperButton: View {
    public var condition: Bool
    public var color: Color
    public var systemName: StepperButtonImage
    public var accessibilityLabel: LocalizedStringKey
    public var action: () -> ()

    public init(
        condition: Bool,
        color: Color = .accentColor,
        systemName: StepperButtonImage,
        accessibilityLabel: LocalizedStringKey = "Value",
        action: @escaping () -> ()
    ) {
        self.condition = condition
        self.color = color
        self.systemName = systemName
        self.accessibilityLabel = accessibilityLabel
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Image(systemName: systemName.rawValue)
                .foregroundColor(condition ? color : .secondary.opacity(0.5))
                .frame(width: 32, height: 32)
        }
        .buttonStyle(.glass)
        .buttonBorderShape(.circle)
        .disabled(!condition)
        .opacity(condition ? 1.0 : 0.3)
        .accessibilityLabel((systemName == .plus ? Text("Increase") : Text("Decrease")) + Text(" ") + Text(accessibilityLabel))
        .accessibilityHint(Text("Double tap to ") + (systemName == .plus ? Text("increase") : Text("decrease")) + Text(" ") + Text(accessibilityLabel) + Text(" by one"))
    }
}

#Preview {
    WideStepperButton(condition: true, color: .red, systemName: .minus, action: {})
}
