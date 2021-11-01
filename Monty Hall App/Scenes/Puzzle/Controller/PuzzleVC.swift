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
    /// Base View Controller init
    init() {
        super.init()
    }
    /// VIew did load cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        /// Background
        self.myView.update(.smoothBackground)
        /// Scene construction
        view.addSubview(scene)
        scene.setScene(root: view)
        /// Collection View Methods
        scene.collection.delegate = self
        scene.collection.dataSource = self
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
        if GameInteractor.interactor.currrentState == .ended {
            GameInteractor.interactor.reset()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        /// 3 - Ended
        case (.madeSecondChoice(let choice), .ended):
            let didWin = montyHallProblem.secondChoice(choice)
            scene.panel.end(didWin: didWin)
            montyHallProblem.openAll()
        /// 4 - Reset
        case (.reset, .waitingForFirstChoice):
            montyHallProblem.reset()
            scene.panel.reset()
        default:
            break
        }
    }
    func receiveError(event: ErrorEvent, at currentState: GameState) {
        ///
    }
}

