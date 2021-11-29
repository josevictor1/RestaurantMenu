//
//  UIColor+.swift
//  RestaurantMenu
//
//  Created by Jose Victor Pereira Costa on 28/11/21.
//

import UIKit

extension UIColor {
    static var appBackground: UIColor { UIColor(named: "appBackground")! }
    static var descriptionValues: UIColor { UIColor(named: "descriptionValues")! }
    static var itemSeparator: UIColor { UIColor(named: "itemSeparator")! }
    static var itemTitle: UIColor { UIColor(named: "itemsTitle")! }
    static var menuTitle: UIColor { UIColor(named: "menuTitle")! }
    static var sectionBorder: UIColor { UIColor(named: "sectionBorder")! }
    static var disabledSection: UIColor { UIColor(named: "disabledSection")! }
}

extension UIColor {
    
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        UIGraphicsImageRenderer(size: size).image { rendererContext in
            setFill()
            rendererContext.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }
    }
}
