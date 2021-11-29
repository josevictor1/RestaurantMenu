//
//  MenuView.swift
//  RestaurantMenu
//
//  Created by Jose Victor Pereira Costa on 27/11/21.
//

import UIKit

final class MenuView: UIView {
    
    var onSectionTapped: ((Int) -> Void)? {
        get { menuSectionsCollectionView.onSectionTapped }
        set { menuSectionsCollectionView.onSectionTapped = newValue }
    }
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .montserrat(ofSize: 16, weight: .regular)
        titleLabel.text = "MENU"
        titleLabel.textColor = .menuTitle
        titleLabel.textAlignment = .center
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
        backgroundColor = .appBackground
    }
    
    private func setUpConstraints() {
        setUpTitleLabelConstraints()
        setUpMenuSectionsCollectionViewConstraints()
        setUpMenuItemsTableViewConstraints()
    }
    
    private func setUpTitleLabelConstraints() {
        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 168),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ]
        place(titleLabel, with: constraints)
    }
    
    private func setUpMenuSectionsCollectionViewConstraints() {
        let constraints = [
            menuSectionsCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                                            constant: 44),
            menuSectionsCollectionView.heightAnchor.constraint(equalToConstant: 100),
            menuSectionsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            menuSectionsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ]
        place(menuSectionsCollectionView, with: constraints)
    }
    
    private func setUpMenuItemsTableViewConstraints() {
        let constraints = [
            menuItemsTableView.topAnchor.constraint(equalTo: menuSectionsCollectionView.bottomAnchor),
            menuItemsTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            menuItemsTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            menuItemsTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        place(menuItemsTableView, with: constraints)
    }
    
    func set(menuSections: [MenuSection]) {
        menuSectionsCollectionView.set(menuSections: menuSections)
    }
    
    func set(menuItems: [MenuItem]) {
        menuItemsTableView.set(menuItems: menuItems)
    }
}
