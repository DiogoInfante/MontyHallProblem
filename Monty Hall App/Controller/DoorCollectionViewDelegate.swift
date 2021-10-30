//
//  DoorCollectionViewDelegate.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 17/02/21.
//

import UIKit
import Foundation

/// Door Collection View Delegate And Data Souce
class DoorCollectionViewDelegateAndDataSoruce: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    /// Monty hall problem model data
    let montyHallProblem: MontyHallProblem
    /// Door collection view
    let doorCollectionView: DoorCollectionView
    /// Initializes a Collection View Delegate and Data Source
    init(_ montyHallProblem: MontyHallProblem, _ doorCollectionView: DoorCollectionView) {
        self.montyHallProblem = montyHallProblem
        self.doorCollectionView = doorCollectionView
    }
    /// Collection view number of elements
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return montyHallProblem.numberOfDoors
    }
    /// Collection view cell setup
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        /// Cell instance
        let cell = doorCollectionView.dequeueReusableCell(withReuseIdentifier: DoorCollectionViewCell.identifier, for: indexPath) as! DoorCollectionViewCell
        ///
        cell.door = montyHallProblem.doors[indexPath.item]
        /// Adds sobserver
        cell.door.observer = cell
        /// Sets door number
        cell.setDoorNumber(indexPath.item + 1)
        /// Sets what is behind the door
        if montyHallProblem.doors[indexPath.item].isPrized {
            cell.prizeDoorSetup()
        }
        else {
            cell.goatDoorSetup()
        }
        return cell
    }
    /// Collection view selection setup
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /// Checks if the first choice was made
        if montyHallProblem.choosenDoor.id == -1 {
            /// First choice given selected cell
            montyHallProblem.firstChoice(id: indexPath.item)
            /// Visualy open doors
            for door in montyHallProblem.doors {
                if door.state == .opened {
                    /// TODO:  Correct reference
                    let cell = collectionView.cellForItem(at: IndexPath(item: door.id, section: 0)) as! DoorCollectionViewCell
                    cell.openDoor()
                }
            }
        }
    }
}
