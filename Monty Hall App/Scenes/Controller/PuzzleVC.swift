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
    /// VIew did load cycle
    override func viewDidLoad() {
        /// Scene construction
        view.addSubview(scene)
        scene.setScene(root: view)
        /// Collection View Methods
        scene.collectionView.delegate = self
        scene.collectionView.dataSource = self
        /// Buttons Targets
        scene.choice.switchChoice.addTarget(self, action: #selector(switchChoice), for: .touchUpInside)
        scene.choice.keepChoice.addTarget(self, action: #selector(keepChoice), for: .touchUpInside)
        scene.reset.addTarget(self, action: #selector(reset), for: .touchUpInside)
        /// First State
        GameInteractor.interactor.start()
    }
    /// Case the user keeps the first choice
    @objc func keepChoice() {
        if GameInteractor.interactor.currrentState == .waitingForSecondChoice {
            GameInteractor.interactor.madeSecondChoice(.keepDoor)
        }
    }
    /// Case the user switches the first choice
    @objc func switchChoice() {
        if GameInteractor.interactor.currrentState == .waitingForSecondChoice {
            GameInteractor.interactor.madeSecondChoice(.switchDoor)
        }
    }
    /// Restart
    @objc func reset() {
        GameInteractor.interactor.reset()
    }
}
/// Collection View Extension
extension PuzzleVC: UICollectionViewDelegate, UICollectionViewDataSource {
    /// Collection view number of elements
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return montyHallProblem.numberOfDoors
    }
    /// Collection view cell setup
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        /// Cell instance
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DoorCollectionViewCell.identifier, for: indexPath) as! DoorCollectionViewCell
        cell.door = montyHallProblem.doors[indexPath.item]
        /// Adds sobserver
        cell.door.observer = cell
        /// Sets door number
        cell.setDoorNumber(indexPath.item + 1)
        return cell
    }
    /// Collection view selection setup
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /// Checks if the first choice was made
        if GameInteractor.interactor.currrentState == .waitingForFirstChoice {
            /// First choice given selected cell
            GameInteractor.interactor.madeFirstChoice(indexPath.item)
        }
    }
}
/// State Machine Extension
extension PuzzleVC: GameInteractorObserver {
    func changingStateFor(event: GameEvent, from oldState: GameState, to newState: GameState) {
        switch (event, newState) {
        /// 1 - Waiting for first choice
        case (.start, .waitingForFirstChoice):
            break
        /// 2 - Waiting for second choice
        case (.madeFirstChoice(let id), .waitingForSecondChoice):
            montyHallProblem.firstChoice(id)
            scene.result.disappear()
        /// 3 - Ended
        case (.madeSecondChoice(let choice), .ended):
            scene.result.appear()
            let didWin = montyHallProblem.secondChoice(choice)
            scene.result.end(didWin: didWin)
            montyHallProblem.openAll()
        /// 4 - Reset
        case (.reset, .waitingForFirstChoice):
            scene.result.reset()
            montyHallProblem.reset()
            scene.result.reset()
        default:
            break
        }
    }
    func receiveError(event: ErrorEvent, at currentState: GameState) {
        ///
    }
}
