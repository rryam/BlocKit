//
//  AStack.swift
//  BlocKit
//
//  Created by Rudrank Riyam on 12/07/21.
//

import SwiftUI

public enum AStackType {
    case color
    case gradient
}

public struct AStack<Content: View>: View {
    let type: AStackType
    let content: () -> Content
    
    public init(type: AStackType, @ViewBuilder content: @escaping () -> Content) {
        self.type = type
        self.content = content
    }
    
    public var body: some View {
        switch type {
            case .color:
                HStack(content: content)
            case .gradient:
                VStack(content: content)
        }
    }
}

struct AStack_Previews: PreviewProvider {
    static var previews: some View {
        AStack(type: .gradient, content: { NavTitleView("AStack") })
    }
}
