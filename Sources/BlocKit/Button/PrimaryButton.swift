//
//  PrimaryButton.swift
//  BlocKit
//
//  Created by Rudrank Riyam on 29/03/21.
//

import SwiftUI

public struct PrimaryGradientButton: View {
  private var title: String
  private var action: () -> ()
  private var color: Color
  
  @Environment(\.colorScheme) var scheme
  
  var gradient: [Color] {
    [color.prominence(scheme: scheme), color.prominence(scheme: scheme).opacity(0.8)]
  }
  
  public init(_ title: String, _ color: Color, _ action: @escaping () -> Void) {
    self.title = title
    self.color = color
    self.action = action
  }
  
  public var body: some View {
    Button(action: action) {
      Text(title)
        .foregroundColor(.traitsBackground)
        .buttonText()
    }
    .buttonStyle(PrimaryButtonStyle({ LinearGradient(gradient: Gradient(colors: gradient), startPoint: .top, endPoint: .bottom).cornerRadius(Constants.cornerRadius) }))
  }
}

public struct PrimaryButton: View {
  private var title: String
  private var action: () -> ()
  
  public init(_ title: String, _ action: @escaping () -> Void) {
    self.title = title
    self.action = action
  }
  
  public var body: some View {
    Button(action: action) {
      Text(title)
        .foregroundColor(.white)
        .buttonText()
    }
    .buttonStyle(PrimaryButtonStyle({ Color.accentColor.cornerRadius(Constants.cornerRadius) }))
  }
}

struct ColoredButton_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      PrimaryButton("Evaluate", {})
    }
  }
}
