//
//  ContentView.swift
//  BlocsKitExample
//
//  Created by Rudrank Riyam on 22/03/21.
//

import SwiftUI
import BlocsKit

enum TabItemType: Int, CaseIterable, Hashable, TabItem {
    case slider = 1
    case button
    case box
    
    var image: String {
        switch self {
            case .slider: return "music.note.list"
            case .button: return "captions.bubble"
            case .box: return "archivebox"
        }
    }
    
    var id: Int {
        self.rawValue
    }
    
    var name: String {
        String(describing: self).lowercased()
    }
}

struct ContentView: View {
    @StateObject private var tabViewModel = TabBarViewModel(TabItemType.allCases, current: TabItemType.button)
    @Environment(\.colorScheme) var scheme

    var body: some View {
        VStack {
            BoxView(.target, .red) {
         //       Text("Hello")
            }
            BoxView(.yours, .orange) {
         //       Text("Hello")
            }
          
//            ScoreView(4, 34, color: .green)
//
//            ScoreView(94, 34, color: .brown)
//            ScoreView(54, 34, color: .red.prominence(scheme: scheme))
        }
        .padding()
        .accentColor(.red)
        //        VStack {
        //            NavTitleView("Title Goes here").padding(.horizontal)
        //
        //            TabView(selection: $tabViewModel.currentTab) {
        //                ForEach(TabItemType.allCases, id: \.id) { item in
        //                    tabItemView(with: item)
        //                        .padding()
        //                        .tag(item.self)
        //                }
        //            }
        //            .accentColor(.pink)
        //            .tabViewStyle(.page(indexDisplayMode: .never))
        //
        //            TabBarView(viewModel: tabViewModel)
        //        }
    }
    
    @ViewBuilder func tabItemView(with item: TabItemType) -> some View {
        switch item {
            case .slider: ControlsView()
            case .button: ButtonsView()
            case .box: BoxView(.target, Color.pink) { }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}

struct ControlsView: View {
    @State private var red: Double = .random(in: 0...1)
    @State private var green: Double = .random(in: 0...1)
    @State private var blue: Double = .random(in: 0...1)
    
    var body: some View {
        VStack(spacing: 0) {
            ControlView($red).accentColor(.red)
            
            ControlView($green).accentColor(.green)
            
            ControlView($blue)
        }
    }
}

struct ButtonsView: View {
    var body: some View {
        VStack {
            SecondaryButton("Show", {})
            PrimaryButton("Next", {})
            SecondaryButton("Try again", {})
            
        }
    }
}

