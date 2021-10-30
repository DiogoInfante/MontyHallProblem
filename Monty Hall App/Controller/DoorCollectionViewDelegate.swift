//
//  DoorCollectionViewDelegate.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 17/02/21.
//

import UIKit
import Foundation

// MARK: Door Collection View Delegate And Data Souce
class DoorCollectionViewDelegateAndDataSoruce: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // Monty hall problem model data
    let montyHallProblem: MontyHallProblem
    
    // Door collection view
    let doorCollectionView: DoorCollectionView
    
    init(_ montyHallProblem: MontyHallProblem, _ doorCollectionView: DoorCollectionView) {
        self.montyHallProblem = montyHallProblem
        self.doorCollectionView = doorCollectionView
    }
    
    // Collection view element number
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return montyHallProblem.numberOfDoors
    }
    
    // Collection view cell setup
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Cell instance
        let cell = doorCollectionView.dequeueReusableCell(withReuseIdentifier: DoorCollectionViewCell.identifier, for: indexPath) as! DoorCollectionViewCell
        
        cell.door = montyHallProblem.doors[indexPath.item]
        cell.door.observer = cell
        
        // Set door number
        cell.setDoorLabelNumber(indexPath.item + 1)
        
        // Set what is behind the door
        if montyHallProblem.doors[indexPath.item].isPrized {
            cell.prizeDoorSetup()
        }
        else {
            cell.goatDoorSetup()
        }
        return cell
    }
    
    // Collection view selection setup
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Checks if the first choice was made
        if montyHallProblem.firstChoice.id == -1 {
            
            // First choice given selected cell
            montyHallProblem.firstChoice(selectedDoorId: indexPath.item)
            
            // Visualy open doors
            
            /// TODO: Higher order function (MAP)
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
