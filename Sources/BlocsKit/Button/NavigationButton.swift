//
//  NavigationButton.swift
//  BlocsKit
//
//  Created by Rudrank Riyam on 29/03/21.
//

import SwiftUI

public struct NavigationButton: View {
    private var imageName: String
    private var label: String
    private var action: () -> ()

    public init(imageName: String, label: String, action: @escaping () -> Void) {
        self.imageName = imageName
        self.label = label
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Image(systemName: imageName)
                .font(.system(size: 25))
                .frame(width: 40, height: 40, alignment: .center)
                .accessibility(label: Text(label))
        }
        .buttonStyle(PlainButtonStyle())
    }
}
