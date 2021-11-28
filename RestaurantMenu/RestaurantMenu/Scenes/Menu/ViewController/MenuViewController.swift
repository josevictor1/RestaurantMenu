//
//  MenuViewController.swift
//  RestaurantMenu
//
//  Created by Jose Victor Pereira Costa on 27/11/21.
//

import UIKit

final class MenuViewController: UIViewController {
    
    private let menuView = MenuView()
    
    override func loadView() {
        view = menuView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

