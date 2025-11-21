//
//  TabBarView.swift
//  BlocsKit
//
//  Created by Rudrank Riyam on 09/07/21.
//

import SwiftUI

public protocol TabItem {
    var id: Int { get }
    var name: String { get }
    var image: String { get }
    
    func isEqualTo(_ other: TabItem) -> Bool
}

extension TabItem where Self: Equatable {
    public func isEqualTo(_ other: TabItem) -> Bool {
        guard let otherItem = other as? Self else { return false }
        return self == otherItem
    }
}

public class TabBarViewModel<T: TabItem>: ObservableObject {
    @Published private(set) var tabItems: [T]
    @Published public var currentTab: T

    public init(_ tabItems: [T], current currentTab: T) {
        self.tabItems = tabItems
        self.currentTab = currentTab
    }
}

// Note - I started off watching this video - [SwiftUI Custom Tab Bar](https://www.youtube.com/watch?v=RbfV_0mfA2k) by [Caleb Wells](https://twitter.com/cr_wells).
// And then made it generic to be used by all of my apps with different tab item requirements.
public struct TabBarView<T: TabItem>: View {
    @Namespace var currentTab
    @ObservedObject var viewModel: TabBarViewModel<T>
    
    public init(viewModel: TabBarViewModel<T>) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        HStack {
            ForEach(viewModel.tabItems, id: \.id) { item in
                GeometryReader { geometry in
                    VStack(spacing: 4) {
                        if viewModel.currentTab.isEqualTo(item) {
                            Color.accentColor
                                .frame(height: 2)
                                .offset(y: -8)
                                .matchedGeometryEffect(id: "currentTab", in: currentTab)
                        }

                        Image(systemName: item.image)
                            .frame(height: 20)

                        Text(item.name)
                            .tracking(1.0)
                            .font(type: .poppins, weight: .light, style: .caption2)
                            .fixedSize()
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: geometry.size.width / 2, height: 44, alignment: .bottom)
                    .padding(.horizontal)
                    .foregroundColor(viewModel.currentTab.isEqualTo(item) ? .accentColor : .secondary)
                    .onTapGesture {
                        withAnimation {
                            viewModel.currentTab = item
                        }
                    }
                    .accessibilityLabel(viewModel.currentTab.isEqualTo(item) ? "Selected, \(item.name)" : "\(item.name)")
                    .accessibilityValue(Text("Tab \(item.id) of \(viewModel.tabItems.count)"))
                }
                .frame(height: 44, alignment: .bottom)
            }
        }
    }
}
