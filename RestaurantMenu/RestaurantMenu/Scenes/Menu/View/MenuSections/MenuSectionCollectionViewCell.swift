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
        return titleLabel
    }()
    
    private let activeLineView: UIView = {
        let activeLineView = UIView()
        activeLineView.backgroundColor = .itemsTitle
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
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
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
    
    func enableSection() {
        titleLabel.textColor = .menuTitle
        activeLineView.isHidden = false
    }
    
    func disableSection() {
        titleLabel.textColor = .disabledSection
        activeLineView.isHidden = false
    }
}
