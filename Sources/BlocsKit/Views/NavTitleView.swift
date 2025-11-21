//
//  NavTitleView.swift
//  BlocsKit
//
//  Created by Rudrank Riyam on 09/07/21.
//

import SwiftUI

public struct NavTitleView: View {
    var title: String
    
    public init(_ title: String) {
        self.title = title
    }
    
    public var body: some View {
        VStack {
            Text(title)
                .kerning(1.0)
                .font(type: .poppins, weight: .bold, style: .headline)
                .accessibility(addTraits: .isHeader)
            Divider()
        }
    }
}

struct NavTitleView_Previews: PreviewProvider {
    static var previews: some View {
        NavTitleView("Navigation Title")
    }
}
