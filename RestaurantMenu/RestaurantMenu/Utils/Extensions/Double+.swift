//
//  Double+.swift
//  RestaurantMenu
//
//  Created by Jose Victor Pereira Costa on 28/11/21.
//

import Foundation

extension Double {
    
    func toDolarCurrencyFormat() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: self)) ?? String()
    }
}
