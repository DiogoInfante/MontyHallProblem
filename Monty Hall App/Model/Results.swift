//
//  Result.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 30/10/21.
//

import Foundation

/// Results
/// A class that models multiple game results history
class Results {
    private(set) var wins: Int = 0
    private(set) var rounds: Int = 0
    private(set) var switches: Int = 0
    private(set) var keeps: Int = 0
    private(set) var winningRate: Double = 0
    /// Adds a experiment and updates the results
    /// - Parameters:
    ///     - win: True if won, false if not
    ///     - secondChoice: secondChoice made
    func addResult(win: Bool, _ secondChoice: SecondChoice) {
        rounds += 1
        if secondChoice == .switchDoor {
           switches += 1
        } else {
            keeps += 1
        }
        if win {
            wins += 1
        }
        winningRate = Double(wins)/Double(rounds)
    }
}
