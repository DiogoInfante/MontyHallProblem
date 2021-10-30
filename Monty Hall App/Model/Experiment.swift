//
//  Result.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 17/02/21.
//

import Foundation

/// Experiment: It consists on a simultation of n games of monty hall with a generic number of doors
/// It gives the winning rate by choosing to always switch or always keep the first choice
class Experiment {
    private var numberOfDoors: Int
    private var rounds: Int
    private var secondChoice: SecondChoice
    private(set) var wins: Int = 0
    var winningRate: Double {
        Double(wins)/Double(rounds)
    }
    /// Initializes a Experiment
    /// - Parameters:
    ///     - numberOfDoors: Number of available doors
    ///     - rounds: Total number of rounds
    ///     - secondChoice: SecondChoice
    init(numberOfDoors: Int, rounds: Int, secondChoice: SecondChoice) {
        self.numberOfDoors = numberOfDoors
        self.rounds = rounds
        self.secondChoice = secondChoice
        multiplePuzzles()
    }
    /// Instantiates multiple puzzles according to class parameters
    func multiplePuzzles() {
        /// Winning events
        var wins: Int = 0
        /// Multiple Interations
        for _ in 0...rounds-1 {
            /// Monty Hall Setup
            let montyHall = MontyHallProblem(numberOfDoors)
            /// First Choice
            montyHall.firstChoice(id: Int.random(in: 0..<numberOfDoors-1))
            /// Second Choice
            if montyHall.secondChoice(secondChoice) {
                /// Interaction update
                wins += 1
            }
        }
    }
    /// Updates experiment parameters and runs it
    /// - Parameters:
    ///     - numberOfDoors: Number of available doors
    ///     - rounds: Total number of rounds
    ///     - secondChoice: SecondChoice
    func update(numberOfDoors: Int, rounds: Int, secondChoice: SecondChoice) {
        self.numberOfDoors = numberOfDoors
        self.rounds = rounds
        self.secondChoice = secondChoice
        multiplePuzzles()
    }
}

