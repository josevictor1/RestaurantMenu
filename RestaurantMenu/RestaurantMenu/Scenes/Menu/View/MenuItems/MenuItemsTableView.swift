//
//  MenuItemsTableView.swift
//  RestaurantMenu
//
//  Created by Jose Victor Pereira Costa on 28/11/21.
//

import Core
import UIKit

typealias MenuItemTableViewDiffableDataSource = UITableViewDiffableDataSource<MenuItemsTableView.Section, MenuItem>
typealias MenuItemTableViewSnapShot = NSDiffableDataSourceSnapshot<MenuItemsTableView.Section, MenuItem>

final class MenuItemsTableView: UIView {
    
    private lazy var tableView: UITableView = UITableView(frame: bounds,
                                                          style: .plain)
    
    private lazy var dataSource = MenuItemTableViewDiffableDataSource(tableView: tableView,
                                                                      cellProvider: cellProvider)
    
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
        registerTableViewCells()
        setUpTableView()
    }
    
    private func setUpBackgroundColor() {
        backgroundColor = .clear
    }
    
    private func setUpTableView() {
        embed(tableView)
        tableView.dataSource = dataSource
        tableView.separatorInset = .zero
        setDataSource()
    }

    private func cellProvider(tableView: UITableView,
                              indexPath: IndexPath,
                              itemIdentifier: MenuItem) -> UITableViewCell? {
        let identifier = String(describing: MenuItemTableViewCell.self)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier,
                                                       for: indexPath) as? MenuItemTableViewCell else {
            return nil
        }
        cell.set(menuItem: itemIdentifier)
        return cell
    }
    
    private func registerTableViewCells() {
        let identifier = String(describing: MenuItemTableViewCell.self)
        tableView.register(MenuItemTableViewCell.self,
                           forCellReuseIdentifier: identifier)
    }
    
    private func setDataSource(with menuItems: [MenuItem] = []) {
        var snapshot = MenuItemTableViewSnapShot()
        snapshot.appendSections([.main])
        snapshot.appendItems(menuItems)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func set(menuItems: [MenuItem]) {
        setDataSource(with: menuItems)
    }
}

extension MenuItemsTableView {
    
    enum Section {
        case main
    }
}
