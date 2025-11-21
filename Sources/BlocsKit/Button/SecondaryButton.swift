//
//  SecondaryButton.swift
//  BlocsKit
//
//  Created by Rudrank Riyam on 13/07/21.
//

import SwiftUI

public struct SecondaryGradientButton: View {
    private var color: Color
    private var title: String
    private var action: () -> ()
    private var disabled: Bool
    
    @Environment(\.colorScheme) var scheme
    
    var gradient: [Color] {
        if disabled {
            return [.gray, .gray.opacity(0.8)]
        } else {
            return [color.prominence(scheme: scheme), color.prominence(scheme: scheme).opacity(0.8)]
        }
    }
    
    public init(title: String, color: Color, disabled: Bool, _ action: @escaping () -> Void) {
        self.title = title
        self.color = color
        self.action = action
        self.disabled = disabled
    }
    
    public var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(color.prominence(scheme: scheme, reverse: true))
                .buttonText()
        }
        .buttonStyle(SecondaryButtonStyle {
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .stroke(LinearGradient(gradient: Gradient(colors: gradient), startPoint: .top, endPoint: .bottom), lineWidth: 1.5)
        })
    }
}

public struct SecondaryButton: View {
    private var title: String
    private var action: () -> ()
    
    public init(_ title: String, _ action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(.primary)
                .buttonText()
        }
        .buttonStyle(SecondaryButtonStyle {
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .stroke(Color.accentColor, lineWidth: 1)
        })
    }
}

struct SecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryButton("Try again", {})
    }
}
