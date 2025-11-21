//
//  ControlView.swift
//  BlocsKit
//
//  Created by Rudrank Riyam on 11/07/21.
//

import SwiftUI

public struct ControlView: View {
    @State private var roundedNumber: Int = 0
    @Binding var value: Double
    let step: Double
    let hapticRange: Int
    
    var showText: Bool
    
#if os(iOS)
    private let generator = UIImpactFeedbackGenerator(style: .medium)
#endif
    
    public init(_ value: Binding<Double>, step: Double = 255, range: Int = 10, showText: Bool = true) {
        self.step = step
        self.hapticRange = range
        self._value = value
        self.showText = showText
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            WideStepper($value, onIncrement: onIncrement, onDecrement: onDecrement) {
                if showText {
                    Spacer()
                    
                    // OffsetText("hello", font: .appButton)
                    
                    Text(String(format: "%.1f", value * step))
                        .kerning(1.0)
                        .foregroundColor(.accentColor)
                        .font(type: .poppins, weight: .light, style: .caption2)
                    
                    Spacer()
                }
            }
            
            WideSlider($value)
                .padding(.vertical, 8)
        }
        .onChange(of: value) { _ in
            if Int(value * step) != roundedNumber && Int(value * step) % hapticRange == 0 {
                roundedNumber = Int(value * step)
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

struct ControlView_Previews: PreviewProvider {
    static var previews: some View {
        ControlView(.constant(0.5))
    }
}
