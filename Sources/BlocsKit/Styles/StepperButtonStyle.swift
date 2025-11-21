//
//  StepperButtonStyle.swift
//  BlocsKit
//
//  Created by Rudrank Riyam on 29/03/21.
//

import SwiftUI

struct StepperButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size: 20))
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .opacity(configuration.isPressed ? 0.5 : 1.0)
    }
}

extension ButtonStyle where Self == StepperButtonStyle {
    static var stepper: StepperButtonStyle { Self() }
}
