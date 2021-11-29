//
//  UIViewController+ActivityIndicator.swift
//  Core
//
//  Created by José Victor Pereira Costa on 11/05/20.
//  Copyright © 2020 José Victor Pereira Costa. All rights reserved.
//

import UIKit

public extension UIViewController {

    private var activityIndicator: ActivityIndicatorView { .shared }

    private func addActivityIndicatorAsSubview() {
        view.addSubview(activityIndicator)
        activityIndicator.frame = CGRect(x: .zero, y: .zero, width: 80, height: 80)
        activityIndicator.center = view.center
    }

    func startLoading() {
        addActivityIndicatorAsSubview()
        activityIndicator.start()
    }

    func stopLoading() {
        activityIndicator.removeFromSuperview()
        activityIndicator.stop()
    }

    func presentErrorAlert(withTitle title: String = "Error",
                           message: String,
                           buttonTitle: String? = nil,
                           handler: ((UIAlertAction) -> Void)? = nil,
                           dismissHandler: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message, preferredStyle: .alert)
        if let buttonTitle = buttonTitle {
            alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: handler))
        }
        
        let dismissAction = UIAlertAction(title: "Ok", style: .default) { [weak self]  _ in
            self?.dismiss(animated: true, completion: dismissHandler)
        }
        
        alert.addAction(dismissAction)
        present(alert, animated: true)
    }
}
