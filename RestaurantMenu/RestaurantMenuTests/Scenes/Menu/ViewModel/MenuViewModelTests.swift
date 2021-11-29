//
//  MenuViewModelTests.swift
//  RestaurantMenuTests
//
//  Created by Jose Victor Pereira Costa on 29/11/21.
//

import XCTest
@testable import RestaurantMenu

final class MenuViewModelTests: XCTestCase {

    func testLoadRestaurantNameData() {
        let viewControllerMock = MenuViewControllerMock()
        let expectation = XCTestExpectation(description: "Should load restaurant name")
        viewControllerMock.onRestaurantNameFetched = { restaurantName in
            expectation.fulfill()
            XCTAssertEqual("Test", restaurantName)
        }
        
        let sut = makeSUT(delegate: viewControllerMock)
        
        sut.loadRestaurantData()
        
        wait(for: [expectation], timeout: 0.5)
    }
    
    func testLoadRestaurantMenuSectionsData() {
        let viewControllerMock = MenuViewControllerMock()
        let expectation = XCTestExpectation(description: "Should load menu sections")
        viewControllerMock.onMenuSctionsChange =  { menuSections in
            expectation.fulfill()
            XCTAssertFalse(menuSections.isEmpty)
        }
        
        let sut = makeSUT(delegate: viewControllerMock)
        
        sut.loadRestaurantData()
        
        wait(for: [expectation], timeout: 0.5)
    }
    
    func testLoadRestaurantMenuItemsData() {
        let viewControllerMock = MenuViewControllerMock()
        let expectation = XCTestExpectation(description: "Should load menu items")
        viewControllerMock.onMenuItemsChange = { menuItems in
            expectation.fulfill()
            XCTAssertFalse(menuItems.isEmpty)
        }
        
        let sut = makeSUT(delegate: viewControllerMock)
        
        sut.loadRestaurantData()
        
        wait(for: [expectation], timeout: 0.5)
    }
    
    func testLoadRestaurantMenuSectionsWithFirstSectionEnabledData() {
        let viewControllerMock = MenuViewControllerMock()
        let expectation = XCTestExpectation(description: "Should load menu sections")
        viewControllerMock.onMenuSctionsChange =  { menuSections in
            expectation.fulfill()
            guard let firstSection = menuSections.first else { return XCTFail() }
            XCTAssertTrue(firstSection.isEnabled)
        }
        
        let sut = makeSUT(delegate: viewControllerMock)
        
        sut.loadRestaurantData()
        
        wait(for: [expectation], timeout: 0.5)
    }
    
    func testSelectMenuSection() {
        let viewControllerMock = MenuViewControllerMock()
        let expectation = XCTestExpectation(description: "Should load menu sections")
        let sut = makeSUT(delegate: viewControllerMock)
        sut.loadRestaurantData()
        let selectedIndex = 2
        viewControllerMock.onMenuSctionsChange =  { menuSections in
            expectation.fulfill()
            XCTAssertNotNil(menuSections[selectedIndex])
            XCTAssertTrue(menuSections[selectedIndex].isEnabled)
        }
        
        sut.selectMenuSection(atIndex: selectedIndex)
        
        wait(for: [expectation], timeout: 0.5)
    }
    
    func testSelectMenuSectionWithOnlyOneEnabledSectionAtTheTime() {
        let viewControllerMock = MenuViewControllerMock()
        let expectation = XCTestExpectation(description: "Should load menu sections")
        let sut = makeSUT(delegate: viewControllerMock)
        sut.loadRestaurantData()
        let selectedIndex = 2
        viewControllerMock.onMenuSctionsChange =  { menuSections in
            expectation.fulfill()
            let numberOfActiveSections = menuSections.filter { $0.isEnabled }.count
            XCTAssertEqual(numberOfActiveSections, 1)
        }
        
        sut.selectMenuSection(atIndex: selectedIndex)
        
        wait(for: [expectation], timeout: 0.5)
    }
    
    func testDelegateFailureOnLoadRestaurantData() {
        let dataSourceMock = MenuDataSourceMock()
        dataSourceMock.error = .unknown
        let viewControllerMock = MenuViewControllerMock()
        let expectation = XCTestExpectation(description: "Should call delegate with error")
        viewControllerMock.onFailedLoadRestaurantData = {
            expectation.fulfill()
        }
        
        let sut = makeSUT(delegate: viewControllerMock, dataSource: dataSourceMock)
        
        sut.loadRestaurantData()
        
        wait(for: [expectation], timeout: 0.5)
    }
    
    private func makeSUT(delegate: MenuViewModelDelegate = MenuViewControllerMock(),
                         dataSource: MenuDataSourceProtocol = MenuDataSourceMock()) -> MenuViewModel {
        return MenuViewModel(delegate: delegate,
                             dataSource: dataSource)
    }
}
