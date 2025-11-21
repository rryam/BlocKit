//
//  Text.swift
//  BlocKit
//
//  Created by Rudrank Riyam on 22/03/21.
//

import SwiftUI

extension Text {
    public func customTitleText(size: CGFloat) -> some View {
        self
            .font(type: .poppins, weight: .black, style: .largeTitle)
            .multilineTextAlignment(.center)
    }
    
    public func titleText() -> some View {
        self
            .font(type: .poppins, weight: .bold, style: .title1)
    }
    
    public func largeTitleText(type: FontType, topPadding: CGFloat = 37) -> some View {
        self
            .font(type: type, weight: .bold, style: .largeTitle)
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, topPadding)
    }
    
    public func buttonText() -> some View {
        self
            .font(type: .poppins, weight: .bold, style: .headline)
            .kerning(1.0)
    }
    
    public func blurredBackgroundText() -> some View {
        self
            .font(type: .poppins, weight: .regular, style: .caption1)
            .baselineOffset(1)
            .foregroundColor(.primary)
            .accessibility(addTraits: .isHeader)
            .padding(.top, 1)
            .padding(.horizontal)
            .padding(8)
            .background(RoundedRectangle(cornerRadius: Constants.cornerRadius / 1.5).fill(Color.white.opacity(0.25)))
    }
}

struct OffsetText<S>: View where S: StringProtocol {
    private var content: S
    private var font: CustomFont
    
    @ScaledMetric(relativeTo: .body) var baselineOffset = 1

    init(_ content: S, font: CustomFont) {
        self.content = content
        self.font = font
    }
    
    var body: some View {
        Text(content)
            .font(font)
            .baselineOffset(baselineOffset)
            .padding(.top, 1)
    }
}

struct CustomFont: Sendable {
    var type: FontType
    var weight: FontWeight
    var style: UIFont.TextStyle
}

extension CustomFont {
    static let appButton = CustomFont(type: .poppins, weight: .light, style: .caption1)
}

