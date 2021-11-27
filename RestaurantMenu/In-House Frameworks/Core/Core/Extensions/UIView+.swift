//
//  UIView+.swift
//  Commons
//
//  Created by José Victor Pereira Costa on 11/03/20.
//  Copyright © 2020 José Victor Pereira Costa. All rights reserved.
//

import UIKit

public extension UIView {

    /// Embed a subview with inside the view method caller.
    /// - Parameter subview: Subview to be embbeded.
    func embed(_ subview: UIView) {
        place(subview, with: [
            leadingAnchor.constraint(equalTo: subview.leadingAnchor),
            trailingAnchor.constraint(equalTo: subview.trailingAnchor),
            topAnchor.constraint(equalTo: subview.topAnchor),
            bottomAnchor.constraint(equalTo: subview.bottomAnchor)
        ])
    }

    func embedToSafeArea(_ subview: UIView) {
        place(subview, with: [
            safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: subview.leadingAnchor),
            safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: subview.trailingAnchor),
            safeAreaLayoutGuide.topAnchor.constraint(equalTo: subview.topAnchor),
            safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: subview.bottomAnchor)
        ])
    }

    /// Add a subview and set constraints.
    /// - Parameters:
    ///   - subview: Subview to be added.
    ///   - constraints: Subview constraints.
    func place(_ subview: UIView, with constraints: [NSLayoutConstraint]) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        NSLayoutConstraint.activate(constraints)
    }

    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        endEditing(true)
    }
}
