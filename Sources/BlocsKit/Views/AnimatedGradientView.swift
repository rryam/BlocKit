//
//  AnimatedGradientView.swift
//  BlocsKit
//
//  Created by Rudrank Riyam on 22/03/21.
//

import SwiftUI

/// This view has been taken from the repository by Nate Farrell. I played around with the code to adjust it for my requirements.
/// Link to the code - https://github.com/nfarrell36/RotatingGradientView/blob/main/RotatingGradientView.swift
/// Link to the article on which it is based on - https://nerdyak.tech/development/2019/09/30/animating-gradients-swiftui.html

public struct AnimatedGradientView: View {
    @State private var gradientA: [Color] = [Color(.systemPurple), Color(.systemIndigo)]
    @State private var gradientB: [Color] = [Color(.systemPurple), Color(.systemIndigo)]

    @State private var firstPlane: Bool = true
    @State private var colorIndex: Int = 1

    private let gradients: [[Color]] = [[Color(.systemPurple), Color(.systemIndigo)],
                                [Color(.systemPink), Color(.systemBlue)],
                                [Color(.systemTeal), Color(.systemGreen)],
                                [Color(.systemPurple), Color(.systemIndigo)]]

    private let timer = Timer.publish(every: 4.0, on: .main, in: .common).autoconnect()

    public var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: gradientA), startPoint: .bottomTrailing, endPoint: .topLeading)
            LinearGradient(gradient: Gradient(colors: gradientB), startPoint: .bottomTrailing, endPoint: .topLeading)
                .opacity(self.firstPlane ? 0 : 1)
        }
        .animation(.easeInOut(duration: 4.0))
        .onReceive(timer) { _ in
            if colorIndex == gradients.count {
                colorIndex = 0
            }

            setGradient(gradient: gradients[colorIndex])
            colorIndex += 1
        }
    }

    private func setGradient(gradient: [Color]) {
        firstPlane ? (gradientB = gradient) : (gradientA = gradient)
        firstPlane = !firstPlane
    }
}
