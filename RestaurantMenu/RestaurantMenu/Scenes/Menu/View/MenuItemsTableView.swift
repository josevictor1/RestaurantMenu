//
//  MenuItemsTableView.swift
//  RestaurantMenu
//
//  Created by Jose Victor Pereira Costa on 28/11/21.
//

import UIKit

final class MenuItemsTableView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    private func setUp() {
        setUpBackgroundColor() 
    }
    
    private func setUpBackgroundColor() {
        backgroundColor = .blue
    }
}
