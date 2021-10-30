//
//  main.swift
//  Monty Hall Problem
//
//  Created by Diogo Infante on 15/02/21.
//

import Foundation

/// Monty Hall Problem Model
class MontyHallProblem {
    /// number Of Doors
    let numberOfDoors: Int
    /// Prized door
    var prizeDoor: Door
    /// List of doors
    var doors: [Door] = []
    /// Fist choice
    var choosenDoor = Door(-1)
    /// Initializes a Monty Hall Problem
    init(_ numberOfDoors: Int) {
        self.numberOfDoors = numberOfDoors
        /// Populate door array
        for i in 0...numberOfDoors-1 {
            doors.append(Door(i))
        }
        /// Setup a prize door
        let prizeDoorId = Int.random(in: 0...numberOfDoors-1)
        doors[prizeDoorId].setAsPrized()
        prizeDoor = doors[prizeDoorId]
    }
    /// The contestor will select a door from the set
    /// - Parameters:
    func firstChoice(id: Int) {
        choosenDoor = doors[id]
        /// Monty will always open goats
        for door in doors {
            /// Neither prize door or choosen door will be opened
            if !door.isPrized && door.id != id {
                door.state = .opened
            }
        }
        /// If the contestor was lucky enough to select the prize
        if id == prizeDoor.id {
            /// Any other door maybe the closed door
            doors[randomNonPrizedDoorSelection(doors).id].state = .closed
        }
    }
    /// The contestor decides to keep the first choice or switch to the other closed door
    func secondChoice(_ secondChoice: SecondChoice) -> Bool {
        switch secondChoice {
        /// In case of keeping the first choice
        case .keepDoor:
            /// The contestor wins if the prize is behind it
            if choosenDoor.isPrized {
                return true
            }
        /// In case of switching doors
        case .switchDoor:
            /// The contestor wins if the prize is behind the closed door
            if !choosenDoor.isPrized {
                return true
            }
        }
        /// If neither possibilities of success happens, then the contestor lose
        return false
    }
    /// Returns a random non prized door
    func randomNonPrizedDoorSelection(_ doors: [Door])->Door {
        /// Filter eligible doors
        let eligibleDoors = doors.filter { $0.isPrized != true }
        /// Returns a random element form eligible doors
        return eligibleDoors[Int.random(in: 0...eligibleDoors.count-1)]
    }
    /// Resets the interaction
    func reset() {
        /// Clear old doors
        doors.removeAll()
        /// Populate door array
        for i in 0...numberOfDoors-1 {
            doors.append(Door(i))
        }
        /// Setup a prize door
        let prizeDoorId = Int.random(in: 0...numberOfDoors-1)
        doors[prizeDoorId].setAsPrized()
        prizeDoor = doors[prizeDoorId]
    }
}
