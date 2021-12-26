//
//  Experiment.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 17/02/21.
//

import Foundation

/// Experiment: It consists on a simultation of n games of monty hall with a generic number of doors
/// It gives the winning rate by choosing to always switch or always keep the first choice
class Experiment {
    /// Number of doors
    private(set) var numberOfDoors: Int
    /// Number of rounds
    private(set) var rounds: Int
    /// Second choice made
    private(set) var secondChoice: SecondChoice
    /// Monty hall problem instance
    private(set) var montyHall: MontyHallProblem
    /// Initializes a Experiment
    /// - Parameters:
    ///     - numberOfDoors: Number of available doors
    ///     - rounds: Total number of rounds
    ///     - secondChoice: SecondChoice
    init(numberOfDoors: Int, secondChoice: SecondChoice, rounds: Int) {
        self.numberOfDoors = numberOfDoors
        self.rounds = rounds
        self.secondChoice = secondChoice
        self.montyHall = MontyHallProblem(numberOfDoors)
    }
    /// Instantiates multiple puzzles according to class parameters
    func run() {
        /// Multiple Interations
        for _ in 0...rounds-1 {
            /// First Choice
            montyHall.firstChoice(Int.random(in: 0..<numberOfDoors-1))
            /// Second Choice
            let _ = montyHall.secondChoice(secondChoice)
            /// Open all
            montyHall.openAll()
            /// Reset
            montyHall.reset()
        }
    }
}
