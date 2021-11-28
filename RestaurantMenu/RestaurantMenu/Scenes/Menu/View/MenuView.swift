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
        titleLabel.font = .montserrat(ofSize: 26, weight: .regular)
        return titleLabel
    }()
    
    private let menuSectionsCollectionView = MenuSectionsCollectionView()
    
    private let menuItemsTableView = MenuItemsTableView()
    
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
        setUpConstraints()
    }
    
    private func setUpBackgroundColor() {
        backgroundColor = .systemBackground
    }
    
    private func setUpConstraints() {
        setUpTitleLabelConstraints()
        setUpMenuSectionsCollectionViewConstraints()
        setUpMenuItemsTableViewConstraints()
    }
    
    private func setUpTitleLabelConstraints() {
        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 75),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ]
        place(titleLabel, with: constraints)
    }
    
    private func setUpMenuSectionsCollectionViewConstraints() {
        let constraints = [
            menuSectionsCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 44),
            menuSectionsCollectionView.heightAnchor.constraint(equalToConstant: 100)
        ]
        place(menuSectionsCollectionView, with: constraints)
    }
    
    private func setUpMenuItemsTableViewConstraints() {
        let constraints = [
            menuItemsTableView.topAnchor.constraint(equalTo: menuSectionsCollectionView.bottomAnchor),
            menuItemsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            menuItemsTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            menuItemsTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        place(menuItemsTableView, with: constraints)
    }
}
