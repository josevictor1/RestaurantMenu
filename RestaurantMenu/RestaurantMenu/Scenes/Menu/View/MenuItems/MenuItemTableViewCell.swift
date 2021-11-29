//
//  MenuItemTableViewCell.swift
//  RestaurantMenu
//
//  Created by Jose Victor Pereira Costa on 28/11/21.
//

import UIKit

final class MenuItemTableViewCell: UITableViewCell {
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .playfairDisplay(ofSize: 38, weight: .regular)
        titleLabel.textColor = .itemTitle
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = .zero
        return titleLabel
    }()
    
    private let ingredientsLabel: UILabel = {
        let ingredientsLabel = UILabel()
        ingredientsLabel.font = .playfairDisplay(ofSize: 20, weight: .regular)
        ingredientsLabel.textColor = .descriptionValues
        ingredientsLabel.textAlignment = .center
        ingredientsLabel.numberOfLines = .zero
        return ingredientsLabel
    }()
    
    private let valueLabel: UILabel = {
        let valueLabel = UILabel()
        valueLabel.font = .montserrat(ofSize: 14, weight: .regular)
        valueLabel.textColor = .descriptionValues
        valueLabel.textAlignment = .center
        valueLabel.numberOfLines = 1
        return valueLabel
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    private func setUp() {
        setUpStackViewConstraints()
        setUpStackViewArrangedSubviews()
        selectionStyle = .none
    }
    
    private func setUpStackViewConstraints() {
        let constraints = [
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30)
        ]
        place(stackView, with: constraints)
    }
    
    private func setUpStackViewArrangedSubviews() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(ingredientsLabel)
        stackView.addArrangedSubview(valueLabel)
    }
    
    func set(menuItem: MenuItem) {
        titleLabel.text = menuItem.title
        ingredientsLabel.text = menuItem.ingredients
        valueLabel.text = menuItem.value
    }
}
