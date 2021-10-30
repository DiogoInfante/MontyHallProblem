//
//  Result.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 17/02/21.
//

import Foundation

//MARK: - Results Data
struct Experiment {
    var wins: Int
    var rounds: Int
    var winningRate: Double {
        Double(wins)/Double(rounds)
    }
    
    // Instantiates multiple puzzles according to given parameters
    static func multiplePuzzles(numberOfDoors: Int, rounds: Int, secondChoice: SecondChoice)-> Experiment {
        
        // Winning events
        var wins: Int = 0
        
        // Multiple Interations
        for _ in 0...rounds-1 {
            
            // Monty Hall Setup
            let montyHall = MontyHallProblem(numberOfDoors)
            
            // First Choice
            montyHall.firstChoice(selectedDoorId: Int.random(in: 0..<numberOfDoors-1))
            
            // Second Choice
            if montyHall.secondChoice(secondChoice: secondChoice) {
                
                // Interaction
                wins += 1
            }
        }
        
        // Final Results
        return Experiment(wins: wins, rounds: rounds)
    }
}

