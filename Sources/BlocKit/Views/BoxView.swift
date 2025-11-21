//
//  BoxView.swift
//  BlocKit
//
//  Created by Rudrank Riyam on 10/07/21.
//

import SwiftUI

public enum BoxHeaderType: String, Sendable {
    case target
    case yours

    public var localizedString: LocalizedStringKey {
        switch self {
        case .target: return "Target"
        case .yours: return "Yours"
        }
    }
}

public struct BoxView<Content: View, Fill: ShapeStyle>: View {
    let header: BoxHeaderType
    let fill: Fill
    let content: Content

    public init(_ header: BoxHeaderType, _ fill: Fill, @ViewBuilder _ content: () -> Content) {
        self.header = header
        self.fill = fill
        self.content = content()
    }

    public var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 16)
                .fill(fill)

            VStack {
                Text(header.localizedString)
                    .modifier(GlassHeaderViewModifier())

                content
            }
        }
        .padding(.bottom, 4)
    }
}

public struct GlassHeaderViewModifier: ViewModifier {
    public init() {}

    public func body(content: Content) -> some View {
        content
            .font(.caption)
            .fontWidth(.expanded)
            .foregroundStyle(.white)
            .accessibility(addTraits: .isHeader)
            .padding(.top, 1)
            .padding(.horizontal)
            .padding(8)
            .glassEffect(.clear.tint(.black.opacity(0.3)), in: .rect(cornerRadius: 8))
            .padding(8)
    }
}

public struct NavigationBarHeader: View {
    let title: LocalizedStringKey

    public init(_ title: LocalizedStringKey) {
        self.title = title
    }

    public var body: some View {
        Text(title)
            .font(.system(size: 24, weight: .bold, design: .rounded))
            .fontWidth(.expanded)
            .foregroundColor(.primary)
    }
}

#Preview {
    GeometryReader { proxy in
        BoxView(.target, .orange, {
            Text("HELLO")
        })
        .frame(width: proxy.size.width, height: proxy.size.height / 3, alignment: .bottom)
    }
    .padding()
    .preferredColorScheme(.light)
}
