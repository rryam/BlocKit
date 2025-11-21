//
//  WideStepper.swift
//  BlocKit
//
//  Created by Rudrank Riyam on 29/03/21.
//

import SwiftUI

public struct WideStepper<Content: View>: View {
    @Binding var value: Double
    public var color: Color
    public var accessibilityLabel: LocalizedStringKey
    public var step: Double

    let onIncrement: () -> ()
    let onDecrement: () -> ()
    let content: Content

    public init(
        _ value: Binding<Double>,
        color: Color = .accentColor,
        accessibilityLabel: LocalizedStringKey = "Value",
        step: Double = 255,
        onIncrement: @escaping () -> (),
        onDecrement: @escaping () -> (),
        @ViewBuilder content: () -> Content
    ) {
        self._value = value
        self.onIncrement = onIncrement
        self.onDecrement = onDecrement
        self.color = color
        self.accessibilityLabel = accessibilityLabel
        self.step = step
        self.content = content()
    }

    public var body: some View {
        HStack {
            WideStepperButton(
                condition: value > 0,
                color: color,
                systemName: .minus,
                accessibilityLabel: accessibilityLabel,
                action: onDecrement
            )

            content

            WideStepperButton(
                condition: value < 1,
                color: color,
                systemName: .plus,
                accessibilityLabel: accessibilityLabel,
                action: onIncrement
            )
        }
    }
}
