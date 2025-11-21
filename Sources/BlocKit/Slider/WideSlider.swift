//
//  WideSlider.swift
//  BlocKit
//
//  Created by Rudrank Riyam on 29/03/21.
//

import SwiftUI

public struct WideSlider: View {
    @Binding var value: Double
    public var color: Color
    public var step: Double
    public var accessibilityLabel: LocalizedStringKey

    public init(
        _ value: Binding<Double>,
        color: Color = .accentColor,
        step: Double = 255,
        accessibilityLabel: LocalizedStringKey = "Value"
    ) {
        self._value = value
        self.color = color
        self.step = step
        self.accessibilityLabel = accessibilityLabel
    }

    public var body: some View {
        Slider(value: $value, in: 0...1)
            .tint(color)
            .accentColor(color)
            .accessibilityLabel(accessibilityLabel)
            .accessibilityValue(Text("\(Int(round(value * step))) out of \(Int(step))"))
            .accessibilityHint(Text("Swipe up or down to adjust") + Text(" ") + Text(accessibilityLabel) + Text(" from 0 to \(Int(step))"))
    }
}

#Preview {
    WideSlider(.constant(0.5), color: .red, step: 255, accessibilityLabel: "Red")
}
