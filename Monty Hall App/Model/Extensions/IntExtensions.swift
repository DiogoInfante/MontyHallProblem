//
//  IntExtensions.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 01/11/21.
//

import Foundation

/// Int Array Extensions
extension Array where Element == Int {
    func increment(_ constant: Int) -> [Int] {
        return self.map { $0 + 1 }
    }
    func getString(separator: String = ",") -> String {
        let stringArray = self.map { String($0) }
        return stringArray.joined(separator: separator)
    }
}
