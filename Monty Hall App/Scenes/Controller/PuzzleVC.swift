//
//  ViewController.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 16/02/21.
//

import UIKit

/// Puzzle View Controller
class PuzzleVC: BaseViewController {
    /// Puzzle Scene
    let scene = PuzzleView()
    /// Monty Hall problem
    var montyHallProblem = MontyHallProblem(3)
    /// Door collection view delegate and data source
    lazy var collectionViewDelegateAndDataSource = DoorCollectionViewDelegateAndDataSoruce(montyHallProblem, scene.collectionView)
    /// VIew did load cycle
    override func viewDidLoad() {
        /// Scene construction
        view.addSubview(scene)
        scene.setScene(root: view)
        /// Collection View Methods
        scene.collectionView.delegate = collectionViewDelegateAndDataSource
        scene.collectionView.dataSource = collectionViewDelegateAndDataSource
        /// Buttons Targets
        scene.choice.switchChoice.addTarget(self, action: #selector(switchChoice), for: .touchUpInside)
        scene.choice.keepChoice.addTarget(self, action: #selector(keepChoice), for: .touchUpInside)
        scene.restart.addTarget(self, action: #selector(restart), for: .touchUpInside)
        /// Test data
        let experiment = Experiment(numberOfDoors: 100, rounds: 10000, secondChoice: .switchDoor)
        print(experiment.wins)
        print(experiment.winningRate)
    }
    /// Case the user keeps the first choice
    @objc func keepChoice() {
        if montyHallProblem.choosenDoor.id != -1 {
            let didWin = montyHallProblem.secondChoice(.keepDoor)
            scene.updateLabel(didWin: didWin)
            openAllDoors()
        }
    }
    /// Case the user switch the first choice
    @objc func switchChoice() {
        if montyHallProblem.choosenDoor.id != -1 {
            let didWin = montyHallProblem.secondChoice(.switchDoor)
            
            scene.updateLabel(didWin: didWin)
            openAllDoors()
        }
    }
    @objc func restart() {
        montyHallProblem.reset()
    }
    /// Check for remaining closed doors and open them
    func openAllDoors() {
        for door in montyHallProblem.doors {
            if door.state == .closed {
                let cell = scene.collectionView.cellForItem(at: IndexPath(item: door.id, section: 0)) as! DoorCollectionViewCell
                cell.openDoor()
            }
        }
    }
    // TODO: Restart function
}


