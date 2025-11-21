//
//  Color.swift
//  BlocKit
//
//  Created by Rudrank Riyam on 29/03/21.
//

import SwiftUI

public extension Color {
    init(red: Int, green: Int, blue: Int) {
        let red = Double(red) / 255
        let green = Double(green) / 255
        let blue = Double(blue) / 255
        
        self.init(red: red, green: green, blue: blue, opacity: 1.0)
    }
    
    init(hex: Int) {
        self.init(red: (hex >> 16) & 0xFF, green: (hex >> 8) & 0xFF, blue: hex & 0xFF)
    }
}

#if os(iOS) || os(visionOS)
public extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let red = CGFloat(red) / 255
        let green = CGFloat(green) / 255
        let blue = CGFloat(blue) / 255
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
#endif

#if os(macOS)
public extension NSColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let red = CGFloat(red) / 255
        let green = CGFloat(green) / 255
        let blue = CGFloat(blue) / 255
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

extension NSColor {
   public class func dynamicColor(light: NSColor, dark: NSColor) -> NSColor {
      if #available(OSX 10.15, *) {
         return NSColor(name: nil) {
            switch $0.name {
            case .darkAqua, .vibrantDark, .accessibilityHighContrastDarkAqua, .accessibilityHighContrastVibrantDark:
               return dark
            default:
               return light
            }
         }
      } else {
        return light
      }
   }
}
#endif

public extension Color {
    static var gradientGray: Color {
#if os(macOS)
        return Color(NSColor.black)
#else
        return Color(UIColor.systemGray5)
#endif
    }
    
    static var secondaryBackground: Color {
#if os(macOS)
        return Color(NSColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1.0))
#else
        return Color(UIColor.systemGray6)
#endif
    }
    
    /// If the app is in dark mode, returns black, otherwise white. Opposite of .primary Color.
    static var traitsBackground: Color {
#if os(macOS)
        Color(NSColor.dynamicColor(light: .white, dark: .black))
#else
        Color(UIColor { (traits) -> UIColor in
            return traits.userInterfaceStyle == .dark ? UIColor.black : UIColor.white
        })
#endif
    }
    
    static var ringBackground: Color {
#if os(macOS)
        let darkRingBackgroundColor = NSColor(red: 27, green: 27, blue: 32)
        let lightRingBackgroundColor = NSColor(red: 200, green: 200, blue: 20)
        
        return Color(NSColor.dynamicColor(light: lightRingBackgroundColor, dark: darkRingBackgroundColor))
#else
        let darkRingBackgroundColor = UIColor(red: 27, green: 27, blue: 32)
        let lightRingBackgroundColor = UIColor(red: 200, green: 200, blue: 20)
        
        return Color(UIColor { (traits) -> UIColor in
            return traits.userInterfaceStyle == .dark ? darkRingBackgroundColor : lightRingBackgroundColor
        })
#endif

    }
    
    static let stroke = Color.primary.opacity(0.1)
}

// Returns a darker shade of the given color in light mode, and light share in dark mode
public extension Color {
    func prominence(value: Double = 0.15, scheme: ColorScheme, reverse: Bool = false) -> Color {
      let prominenceValue = scheme == .light ? value : -value
//        
//        if reverse {
//            prominenceValue = -prominenceValue
//        }
//                
        #if os(macOS)
        let components = NSColor(self).cgColor.components
        #else
        let components = UIColor(self).cgColor.components
        #endif
        let red: CGFloat = components?[0] ?? 0.0
        let green: CGFloat = components?[1] ?? 0.0
        let blue: CGFloat = components?[2] ?? 0.0
                
        return Color(red: Double(red) - prominenceValue, green: Double(green) - prominenceValue, blue: Double(blue) - prominenceValue)
    }
}
