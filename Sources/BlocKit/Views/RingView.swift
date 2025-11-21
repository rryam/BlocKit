//
//  RingView.swift
//  BlocKit
//
//  Created by Rudrank Riyam on 06/04/21.
//

import SwiftUI

public struct ScoreView: View {
    private var seconds: Int
    private var score: Double
    private var highScore: Double
    private var color: Color
        
    public init(_ score: Double, _ highScore: Double, seconds: Int = 15, color: Color) {
        self.seconds = seconds
        self.highScore = highScore
        self.score = score
        self.color = color
    }
    
    public var body: some View {
        HStack {
            UserScoreView(score, color: color)
                .padding(.horizontal)
            
            Divider()
            
            VStack {
                AnalyticsInfoView("HIGH SCORE".lowercased(), value: String(format: "%.2f", highScore), color: color)
                
                Divider()
                
                AnalyticsInfoView("SECONDS TAKEN".lowercased(), value: String(describing: seconds), color: color)
            }
        }
        .padding(.top)
    }
}

public struct AnalyticsInfoView: View {
    private var title: String
    private var value: String
    private var color: Color
        
    public init(_ title: String, value: String, color: Color) {
        self.title = title
        self.value = value
        self.color = color
    }
    
    public var body: some View {
        VStack {
            Text(title)
                .kerning(1)
                .font(.callout.weight(.light))
                .foregroundColor(.primary)
            
            Text(value)
                .kerning(1)
                .font(.title.weight(.bold))
                .foregroundColor(color)
        }
        .multilineTextAlignment(.center)
    }
}

public struct UserScoreView: View {
    private var score: Double
    private var color: Color
    
    public init(_ score: Double, color: Color) {
        self.score = score
        self.color = color
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                ProgressRingView(progress: CGFloat(score) / 100, foregroundColor: color)
                VStack(spacing: 0) {
                    Text("SCORE".lowercased())
                        .kerning(1)
                        .font(.callout.weight(.light))
                        .foregroundColor(.primary)
                    
                    Text(String(format: "%.2f", score))
                        .kerning(1)
                        .font(.title.weight(.bold))
                        .accessibility(label: Text("\(String(format: "%.2f", score)) points"))
                        .foregroundColor(color)
                }
                .accessibilityElement(children: .combine)
            }
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(85.0, 100.0, color: .red)
    }
}

struct ProgressRingView: View {
    var progress: CGFloat
    var lineWidth: CGFloat = 20
    var size: CGFloat = 150
    var foregroundColor: Color
    
    @Environment(\.colorScheme) var scheme

    var gradient: [Color] {
        [foregroundColor.prominence(scheme: scheme), foregroundColor.prominence(scheme: scheme).opacity(0.8)]
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.systemGrey6, style:
                            StrokeStyle(lineWidth: lineWidth))
            
            Circle()
                .trim(from: 1 - progress, to: 1)
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: gradient),
                        startPoint: .leading, endPoint: .trailing),
                    style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)
                )
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180),
                                  axis: (x: 1, y: 0, z: 0))
        }
    }
}

extension Color {
    static var systemGrey6: Color {
#if os(macOS)
        return Color(NSColor.lightGray)
#else
        return Color(UIColor.systemGray6)
#endif
    }
}
