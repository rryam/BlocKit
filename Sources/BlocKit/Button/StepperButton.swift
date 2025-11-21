//
//  StepperButton.swift
//  BlocKit
//
//  Created by Rudrank Riyam on 29/03/21.
//

import SwiftUI

public struct StepperButton: View {
    private var imageName: String
    private var label: String
    private var foregroundColor: Color
    private var action: () -> ()

    public init(imageName: String, label: String, foreground: Color, _ action: @escaping () -> Void) {
        self.imageName = imageName
        self.label = label
        self.action = action
        self.foregroundColor = foreground
    }

    public var body: some View {
        Button(action: action) {
            Image(systemName: imageName)
                .accessibility(label: Text(label))
                .font(.system(size: 16))
                .foregroundColor(foregroundColor)
        }
        .buttonStyle(StepperButtonStyle())
    }
}
