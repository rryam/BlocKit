//
//  BoxView.swift
//  BlocsKit
//
//  Created by Rudrank Riyam on 10/07/21.
//

import SwiftUI
import UIKit

public enum BoxHeaderType: String {
    case target
    case yours
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
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .fill(fill)
                .overlay(RoundedRectangle(cornerRadius: Constants.cornerRadius)
                            .stroke(Color.stroke))
            
            VStack {
                Text(header.rawValue.lowercased())
                    .blurredBackgroundText()

                    .padding(8)
//                    .background(
//                        NotchRectangle(corner: [.bottomLeft, .bottomRight], size: Constants.cornerRadius / 1.5)
//                            .fill(Color.white.opacity(0.25))
//                                    .padding(.top, -1))
                content
            }
        }
        .padding(.bottom, 4)
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

struct BoxView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in
        BoxView(.target, .orange, {
            Text("HELLO")
        })
                .frame(width: proxy.size.width, height: proxy.size.height / 3, alignment: .bottom)
        }
        .padding()
        .preferredColorScheme(.light)

    }
}

struct NotchRectangle: Shape {
    var corner: UIRectCorner
    var size: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: size, height: size))
        
        return Path(path.cgPath)
    }
}
