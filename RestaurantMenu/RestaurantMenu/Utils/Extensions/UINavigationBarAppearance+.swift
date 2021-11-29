//
//  UINavigationBarAppearance+.swift
//  RestaurantMenu
//
//  Created by Jose Victor Pereira Costa on 28/11/21.
//

import UIKit

extension UINavigationBarAppearance {
    
    static var montserratNavigationBarAppearance: UINavigationBarAppearance {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.shadowColor = .disabledSection
        navigationBarAppearance.backgroundColor = .appBackground
        navigationBarAppearance.titleTextAttributes = [.font : UIFont.montserrat(ofSize: 16, weight: .regular),
                                                .strokeColor : UIColor.itemTitle]
        return navigationBarAppearance
    }
}
