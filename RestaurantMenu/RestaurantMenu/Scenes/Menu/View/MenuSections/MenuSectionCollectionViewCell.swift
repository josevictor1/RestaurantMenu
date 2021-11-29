//
//  MenuSectionCollectionViewCell.swift
//  RestaurantMenu
//
//  Created by Jose Victor Pereira Costa on 28/11/21.
//

import Core
import UIKit

final class MenuSectionCollectionViewCell: UICollectionViewCell {
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .montserrat(ofSize: 24, weight: .regular)
        titleLabel.textColor = .disabledSection
        titleLabel.numberOfLines = .zero
        titleLabel.textAlignment = .center
        titleLabel.adjustsFontSizeToFitWidth = true
        return titleLabel
    }()
    
    private let activeLineView: UIView = {
        let activeLineView = UIView()
        activeLineView.backgroundColor = .itemTitle
        activeLineView.isHidden = true
        return activeLineView
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
        setUpTitleLabelConstraints()
        setUpActiveLineViewConstraints()
    }
    
    private func setUpTitleLabelConstraints() {
        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ]
        place(titleLabel, with: constraints)
    }
    
    private func setUpActiveLineViewConstraints() {
        let constraints = [
            activeLineView.heightAnchor.constraint(equalToConstant: 3),
            activeLineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            activeLineView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -7),
            activeLineView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 7)
        ]
        place(activeLineView, with: constraints)
    }
    
    func set(menuSection: MenuSection) {
        titleLabel.text = menuSection.title
        updateSectionState(with: menuSection)
    }
    
    private func updateSectionState(with menuSection: MenuSection) {
        if menuSection.isEnabled {
            enableSection()
        } else {
            disableSection()
        }
    }
    
    private func enableSection() {
        titleLabel.textColor = .menuTitle
        activeLineView.isHidden = false
    }
    
    private func disableSection() {
        titleLabel.textColor = .disabledSection
        activeLineView.isHidden = true
    }
}
