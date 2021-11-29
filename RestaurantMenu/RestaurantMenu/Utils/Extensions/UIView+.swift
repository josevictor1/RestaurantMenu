//
//  UIView+.swift
//  RestaurantMenu
//
//  Created by Jose Victor Pereira Costa on 28/11/21.
//

import UIKit

enum BorderSide {
    case top, bottom
}

extension UIView {
    
    func addBorderView(boderSide: BorderSide, withHeight height: CGFloat, color: UIColor) {
        switch boderSide {
        case .top:
            addTopBorderView(withHeight: height, color: color)
        case .bottom:
            addBottomBorderView(withHeight: height, color: color)
        }
    }
    
    private func addTopBorderView(withHeight height: CGFloat, color: UIColor) {
        let view = UIView()
        view.backgroundColor = color
        let constraints = [
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.heightAnchor.constraint(equalToConstant: height)
        ]
        place(view, with: constraints)
    }
    
    private func addBottomBorderView(withHeight height: CGFloat, color: UIColor) {
        let view = UIView()
        view.backgroundColor = color
        let constraints = [
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.heightAnchor.constraint(equalToConstant: height)
        ]
        place(view, with: constraints)
    }
}
