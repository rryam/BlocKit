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
            .font(.largeTitle.weight(.black))
            .multilineTextAlignment(.center)
    }

    public func titleText() -> some View {
        self
            .font(.title.weight(.bold))
    }

    public func largeTitleText(topPadding: CGFloat = 37) -> some View {
        self
            .font(.largeTitle.weight(.bold))
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, topPadding)
    }

    public func buttonText() -> some View {
        self
            .font(.headline.weight(.bold))
            .kerning(1.0)
    }

    public func blurredBackgroundText() -> some View {
        self
            .font(.caption)
            .baselineOffset(1)
            .foregroundColor(.primary)
            .accessibility(addTraits: .isHeader)
            .padding(.top, 1)
            .padding(.horizontal)
            .padding(8)
            .background(RoundedRectangle(cornerRadius: Constants.cornerRadius / 1.5).fill(Color.white.opacity(0.25)))
    }
}
