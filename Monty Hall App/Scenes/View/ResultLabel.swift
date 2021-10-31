//
//  ResultLabel.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 30/10/21.
//

import UIKit

class ResultLabel: UILabel {
    /// Set label layout
    /// - Parameters:
    ///     - didWin: Indicates if player won the prize
    func end(didWin: Bool) {
        if didWin {
            self.text = "Win!"
            self.backgroundColor = .green
        }
        else {
            self.text = "Lost"
            self.backgroundColor = .systemRed
        }
    }
    /// Resets label to initial state
    func reset() {
        self.text = "First Choice"
        self.backgroundColor = .yellow
    }
}
