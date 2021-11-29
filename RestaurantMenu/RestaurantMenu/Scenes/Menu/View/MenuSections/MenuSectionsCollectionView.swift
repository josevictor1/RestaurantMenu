//
//  MenuSectionsCollectionView.swift
//  RestaurantMenu
//
//  Created by Jose Victor Pereira Costa on 28/11/21.
//
import Core
import UIKit

private typealias MenuSectionsCollectionViewDiffableDataSource = UICollectionViewDiffableDataSource<MenuSectionsCollectionView.Section, MenuSection>
private typealias MenuSectionsCollectionViewCellRegistration =  UICollectionView.CellRegistration<MenuSectionCollectionViewCell, MenuSection>
private typealias MenuSecttionsCollectionViewDataSourceSnapshot = NSDiffableDataSourceSnapshot<MenuSectionsCollectionView.Section, MenuSection>

final class MenuSectionsCollectionView: UIView {
    
    var onSectionTapped: ((Int) -> Void)?
    
    private lazy var collectionView: UICollectionView = {
        UICollectionView(frame: bounds,
                         collectionViewLayout: .horizontalLayout)
    }()
    
    private lazy var dataSource: MenuSectionsCollectionViewDiffableDataSource = {
        MenuSectionsCollectionViewDiffableDataSource(collectionView: collectionView,
                                                     cellProvider: cellProvider)
    }()
    
    private let cellRegistration: MenuSectionsCollectionViewCellRegistration = {
        MenuSectionsCollectionViewCellRegistration { cell, _, section in
            cell.set(menuSection: section)
        }
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
        setUpSeparators()
        setUpCollectionView()
    }
    
    private func setUpBackgroundColor() {
        backgroundColor = .white
    }
    
    private func setUpSeparators() {
        addBorderView(boderSide: .top, withHeight: 1, color: .sectionBorder)
        addBorderView(boderSide: .bottom, withHeight: 1, color: .sectionBorder)
    }
    
    private func setUpCollectionView() {
        setUpCollectionViewConstraints()
        collectionView.backgroundColor = .clear
        collectionView.alwaysBounceVertical = false
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        setDataSource()
    }
    
    private func setUpCollectionViewConstraints() {
        collectionView = UICollectionView(frame: bounds, collectionViewLayout: .horizontalLayout)
        embed(collectionView)
    }
    
    private func cellProvider(collectionView: UICollectionView,
                              indexPath: IndexPath,
                              item: MenuSection) -> UICollectionViewCell? {
        collectionView.dequeueConfiguredReusableCell(using: cellRegistration,
                                                     for: indexPath,
                                                     item: item)
    }
    
    func set(menuSections: [MenuSection]) {
        setDataSource(with: menuSections)
    }
    
    private func setDataSource(with menuSections: [MenuSection] = []) {
        var snapshot = MenuSecttionsCollectionViewDataSourceSnapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(menuSections)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension MenuSectionsCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        scrollToCell(at: indexPath)
        onSectionTapped?(indexPath.row)
    }
    
    private func scrollToCell(at indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}

extension MenuSectionsCollectionView {
    
    enum Section: Hashable {
        case main
    }
}
