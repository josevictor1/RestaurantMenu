//
//  UIViewController+.swift
//  RestaurantMenu
//
//  Created by Jose Victor Pereira Costa on 28/11/21.
//

import UIKit

extension UIViewController {
    
    func addNavigationBarShadowLine() {
        let lineSize = CGSize(width: view.frame.width, height: 1)
        let shadowImage = UIColor.black.image(lineSize)
        navigationController?.navigationBar.clipsToBounds = false
        navigationController?.navigationBar.shadowImage = shadowImage
    }
}
