//
//  ControlView.swift
//  BlocKit
//
//  Created by Rudrank Riyam on 11/07/21.
//

import SwiftUI

public struct ControlView: View {
    @State private var roundedNumber: Int = 0
    @Binding var value: Double
    let step: Double
    let hapticRange: Int
    let color: Color
    let showText: Bool
    let accessibilityLabel: LocalizedStringKey

#if os(iOS)
    private let generator = UIImpactFeedbackGenerator(style: .medium)
#endif

    public init(
        _ value: Binding<Double>,
        step: Double = 255,
        range: Int = 10,
        showText: Bool = true,
        color: Color = .accentColor,
        accessibilityLabel: LocalizedStringKey = "Value"
    ) {
        self.step = step
        self.hapticRange = range
        self._value = value
        self.showText = showText
        self.color = color
        self.accessibilityLabel = accessibilityLabel
    }

    public var body: some View {
        VStack(spacing: 0) {
            Text("\(Int(round(value * step)))")
                .tracking(1.0)
                .foregroundStyle(color.gradient)
                .fontWidth(.expanded)
                .font(.system(.caption, design: .rounded))
                .bold()
                .frame(minWidth: 100)
                .contentTransition(.numericText())
                .animation(.smooth, value: value)
                .accessibilityHidden(true)

            WideStepper(
                $value,
                color: color,
                accessibilityLabel: accessibilityLabel,
                step: step,
                onIncrement: onIncrement,
                onDecrement: onDecrement
            ) {
                WideSlider(
                    $value,
                    color: color,
                    step: step,
                    accessibilityLabel: accessibilityLabel
                )
                .padding(.horizontal, 12)
            }
        }
        .padding(.bottom, 20)
        .onChange(of: value) { oldValue, newValue in
            if Int(newValue * step) != roundedNumber && Int(newValue * step) % hapticRange == 0 {
                roundedNumber = Int(newValue * step)
                hapticFeedback()
            }
        }
        .onAppear {
#if os(iOS)
            generator.prepare()
#endif
        }
    }

    private func onDecrement() {
        if value > 0 {
            value -= (1 / step)
            hapticFeedback()
        }
    }

    private func onIncrement() {
        if value < 1 {
            value += (1 / step)
            hapticFeedback()
        }
    }

    private func hapticFeedback() {
#if os(iOS)
        generator.impactOccurred()
#endif
    }
}

#Preview {
    ControlView(.constant(0.5), color: .red)
}
