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
    /// List of doors
    private(set) var doors: [Door] = []
    /// Prized door
    private(set) var prizeDoor: Door = .null
    /// Fist choice
    private(set) var choosenDoor: Door = .null
    /// Results
    private(set) var results = Results()
    /// Initializes a Monty Hall Problem
    init(_ numberOfDoors: Int) {
        self.numberOfDoors = numberOfDoors
        /// Populate door array
        for index in 0...numberOfDoors-1 {
            doors.append(Door(index))
        }
        /// Adds a prize to a random door
        addPrize()
    }
    /// Adds a prize to a random door
    func addPrize() {
        let prizeDoorId = Int.random(in: 0...numberOfDoors-1)
        doors[prizeDoorId].isPrized = true
        self.prizeDoor = doors[prizeDoorId]
    }
    /// The contestor will select a door from the set
    /// - Parameters:
    ///     - id: Given a id of the first choice
    func firstChoice(_ id: Int) {
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
    /// If the second choice is correct the player wins the game
    /// On contrary the player looses
    /// - Parameters:
    ///     - secondChoice: .keepDoor or .switchDoor
    /// - Returns:
    ///     - A boolean indicating if the second choice was correct or not
    func secondChoice(_ secondChoice: SecondChoice) -> Bool {
        switch secondChoice {
        /// In case of keeping the first choice
        case .keepDoor:
            /// The contestor wins if the prize is behind it
            if choosenDoor.isPrized {
                results.addResult(win: true, .keepDoor)
                return true
            }
        /// In case of switching doors
        case .switchDoor:
            /// The contestor wins if the prize is behind the closed door
            if !choosenDoor.isPrized {
                results.addResult(win: true, .switchDoor)
                return true
            }
        }
        /// If neither possibilities of success happens, then the contestor lose
        results.addResult(win: false, secondChoice)
        return false
    }
    /// Reveals Prize: Open all doors
    func openAll() {
        for index in 0...numberOfDoors-1 {
            doors[index].state = .opened
        }
    }
    /// Returns a random non prized door
    /// - Parameters:
    ///     - doors: list of all doors
    /// - Returns:
    ///     - Returns a random element form eligible doors
    func randomNonPrizedDoorSelection(_ doors: [Door]) -> Door {
        /// Filter eligible doors
        let eligibleDoors = doors.filter { $0.isPrized != true }
        /// Returns a random element form eligible doors
        return eligibleDoors[Int.random(in: 0...eligibleDoors.count-1)]
    }
    /// Resets the interaction
    func reset() {
        /// Close all doors and removes the prize
        for index in 0...numberOfDoors-1 {
            doors[index].state = .closed
            doors[index].isPrized = false
        }
        /// Adds the prize to a random door
        addPrize()
    }
    /// Get open door ids
    /// - Returns:
    ///     - Returns all open doors ids
    func getOpenIds() -> [Int] {
        let openDoors = self.doors.filter { $0.state == .opened}
        return openDoors.map { $0.id }
    }
    /// Get switch door id
    /// - Returns:
    ///     - Returns the id of the option to switch door
    func getSwitchId() -> Int {
        let closedDoors = self.doors.filter { $0.state == .closed}
        let switchDoor = closedDoors.filter { $0.id != choosenDoor.id}
        return switchDoor.first?.id ?? -1
    }
    /// Get choosen door id
    /// - Returns:
    ///     - Returns the first choice door id
    func getChoosenId() -> Int {
        return choosenDoor.id
    }
}
