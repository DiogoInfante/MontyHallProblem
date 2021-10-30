//
//  ViewController.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 16/02/21.
//

import UIKit

// MARK: - Puzzle View Controller
class PuzzleViewController: UIViewController {
    
    // Door collection view
    var doorCollectionView = DoorCollectionView()
    
    // Keep choice button
    var keepChoiceButton = UIButton()
    
    // Switch choice button
    var switchChoiceButton = UIButton()
    
    // Result label
    var resultLabel = UILabel()
    
    // Monty Hall problem
    var montyHallProblem = MontyHallProblem(3)
    
    // Door collection view delegate and data source
    lazy var doorCollectionViewDelegateAndDataSource = DoorCollectionViewDelegateAndDataSoruce(montyHallProblem, doorCollectionView)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup door collection view
        setupDoorCollectionView()
        
        // Setup view properties
        setupViewProperties()
        
        switchChoiceButton.addTarget(self, action: #selector(switchChoice), for: .touchUpInside)
        
        keepChoiceButton.addTarget(self, action: #selector(keepChoice), for: .touchUpInside)
        
        // Test data
        let experiment = Experiment.multiplePuzzles(numberOfDoors: 100, rounds: 10000, secondChoice: .switchDoor)
        print(experiment.wins)
        print(experiment.winningRate)
    }
    
    // Setup colection view
    func setupDoorCollectionView() {
        doorCollectionView.delegate = doorCollectionViewDelegateAndDataSource
        doorCollectionView.dataSource = doorCollectionViewDelegateAndDataSource
    }
    
    /// TODO: Summarize it in one function
    @objc func keepChoice() {
        
        /// TODO: First choice nil -> case
        if montyHallProblem.firstChoice.id != -1 {
            let didWin = montyHallProblem.secondChoice(secondChoice: .keepDoor)
            
            labelLayout(didWin: didWin)
            openAllDoors()
        }
    }
    
    @objc func switchChoice() {
        if montyHallProblem.firstChoice.id != -1 {
            let didWin = montyHallProblem.secondChoice(secondChoice: .switchDoor)
            
            labelLayout(didWin: didWin)
            openAllDoors()
        }
    }
    
    // Check for remaining closed doors and open them
    func openAllDoors() {
        
        /// TODO: Higher order function (MAP)
        for door in montyHallProblem.doors {
            
            if door.state == .closed {
                let cell = doorCollectionView.cellForItem(at: IndexPath(item: door.id, section: 0)) as! DoorCollectionViewCell
                cell.openDoor()
            }
        }
    }
    
    // TODO: Restart function
}


