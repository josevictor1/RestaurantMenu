//
//  MenuView.swift
//  RestaurantMenu
//
//  Created by Jose Victor Pereira Costa on 27/11/21.
//

import UIKit

final class MenuView: UIView {
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        
        return titleLabel
    }()
    
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
        backgroundColor = .systemBackground
    }
}
