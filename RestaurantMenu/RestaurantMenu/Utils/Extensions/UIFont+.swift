//
//  UIFont+.swift
//  RestaurantMenu
//
//  Created by Jose Victor Pereira Costa on 27/11/21.
//

import UIKit

extension UIFont {
    
    static func montserrat(ofSize fontSize: CGFloat, weight: Weight) -> UIFont {
        font(fontFamily: "Montserrat", size: fontSize, weight: weight)
    }
    
    static func helveticaNeue(ofSize fontSize: CGFloat, weight: Weight) -> UIFont {
        font(fontFamily: "HelveticaNeue", size: fontSize, weight: weight)
    }
    
    static func avenirNext(ofSize fontSize: CGFloat, weight: Weight) -> UIFont {
        font(fontFamily: "AvenirNext", size: fontSize, weight: weight)
    }
    
    static func playfairDisplay(ofSize fontSize: CGFloat, weight: Weight) -> UIFont {
        font(fontFamily: "PlayfairDisplay", size: fontSize, weight: weight)
    }
    
    static private func font(fontFamily: String, size: CGFloat, weight: Weight) -> UIFont {
        guard let name = name(fontFamily: fontFamily, weight: weight) else {
            return .systemFont(ofSize: size, weight: weight)
        }
        return UIFont(name: name, size: size)!
    }
    
    static private func name(fontFamily: String, weight: Weight) -> String? {
        switch weight {
        case .bold:
            return fontFamily + "-" + "Bold"
        case .heavy:
            return fontFamily + "-" + "Heavy"
        case .light:
            return fontFamily + "-" + "Light"
        case .medium:
            return fontFamily + "-" + "Medium"
        case .regular:
            return fontFamily + "-" + "Regular"
        case .semibold:
            return fontFamily + "-" + "Semibold"
        case .black:
            return fontFamily + "-" + "Black"
        case .ultraLight:
            return fontFamily + "-" + "UltraLight"
        case .thin:
            return fontFamily + "-" + "Thin"
        default:
            return nil
        }
    }
}
