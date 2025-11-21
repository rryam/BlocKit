//
//  MadeWithLoveView.swift
//  MadeWithLoveView
//
//  Created by Rudrank Riyam on 04/09/21.
//

import SwiftUI

public struct MadeWithLoveView: View {
    private var title: String
    
    public init(_ title: String = "MADE WITH ❤️ BY RUDRANK RIYAM") {
        self.title = title
    }
    
    public var body: some View {
        Text(title.lowercased())
            .foregroundColor(.primary)
            .kerning(1)
            .font(type: .poppins, weight: .regular, style: .caption1)
            .frame(minWidth: 100, maxWidth: .infinity, alignment: .center)
            .multilineTextAlignment(.center)
            .accessibility(label: Text("MADE WITH LOVE BY RUDRANK RIYAM"))
            .padding(.bottom)
    }
}

struct MadeWithLoveView_Previews: PreviewProvider {
    static var previews: some View {
        MadeWithLoveView()
    }
}
