//
//  DismissButton.swift
//  BlocKit
//
//  Created by Rudrank Riyam on 13/07/21.
//

import SwiftUI

public struct DismissButton: View {
    var action: () -> ()

    public init(_ action: @escaping () -> ()) {
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .fill(Color.gray)
                .frame(width: 50, height: 5)
        }
    }
}

struct DismissButton_Previews: PreviewProvider {
    static var previews: some View {
        DismissButton({})
    }
}
