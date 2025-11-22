//
//  GradientButton.swift
//  BlocKitExample
//
//  Created by Rudrank Riyam on 22/03/21.
//

import SwiftUI

public struct GradientButton: View {
  private var title: String

#if os(iOS)
  private var font: UIFont.TextStyle = .headline
#elseif os(macOS)
  private var font: NSFont.TextStyle = .headline
#else
  private var font: Font.TextStyle = .headline
#endif
  private var action: () -> ()
  
  public init(title: String, action: @escaping () -> ()) {
    self.title = title
    self.action = action
  }
  
  public var body: some View {
    Button(action: action) {
      Text(title)
        .kerning(1.0)
        .font(.callout.weight(.light))
    }
    .padding(.bottom)
    .buttonStyle(GradientButtonStyle())
  }
}

struct GradientButton_Previews: PreviewProvider {
  static var previews: some View {
    GradientButton(title: "Evaluate", action: {})
  }
}
