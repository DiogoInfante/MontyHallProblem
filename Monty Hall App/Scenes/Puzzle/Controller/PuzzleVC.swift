//
//  ViewController.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 16/02/21.
//

import UIKit

/// Puzzle View Controller
class PuzzleVC: BaseViewController<PuzzleView>, PuzzleDelegate {
    /// State Machine
    var stateMachine = StateMachine()
    /// Monty Hall problem
    var montyHallProblem = MontyHallProblem(3)
    /// Initializes a Puzzle View Controller
    init() {
        super.init(scene: PuzzleView())
    }
    /// VIew did load cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        /// Background
        self.contentView.update(.smoothBackground)
        /// Scene setup
        view.addSubview(scene)
        scene.setScene(root: contentView)
        /// Set delegate
        set(delegate: self)
        /// Buttons Targets
        scene.choice.switchChoice.subView.addTarget(self, action: #selector(switchChoice), for: .touchUpInside)
        scene.choice.keepChoice.subView.addTarget(self, action: #selector(keepChoice), for: .touchUpInside)
        scene.reset.subView.addTarget(self, action: #selector(reset), for: .touchUpInside)
        /// First State
        stateMachine.start()
    }
    /// Case the user keeps the first choice
    @objc func keepChoice() {
        if stateMachine.currentState == .waitingForSecondChoice {
            stateMachine.madeSecondChoice(.keepDoor)
        }
    }
    /// Case the user switches the first choice
    @objc func switchChoice() {
        if stateMachine.currentState == .waitingForSecondChoice {
            stateMachine.madeSecondChoice(.switchDoor)
        }
    }
    /// Restart
    @objc func reset() {
        if stateMachine.currentState == .ended {
            stateMachine.reset()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
/// Collection View Extension
extension PuzzleVC {
    /// Collection view number of elements
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return montyHallProblem.numberOfDoors
    }
    /// Collection view cell setup
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        /// Cell instance
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: DoorCollectionViewCell.identifier,
            for: indexPath) as? DoorCollectionViewCell else { return  DoorCollectionViewCell() }
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
        if stateMachine.currentState == .waitingForFirstChoice {
            /// First choice given selected cell
            stateMachine.madeFirstChoice(indexPath.item)
        }
    }
}
/// State Machine Extension
extension PuzzleVC {
    func changingStateFor(event: GameEvent, from oldState: GameState, to newState: GameState) {
        switch (event, newState) {
        /// 1 - Waiting for first choice
        case (.start, .waitingForFirstChoice):
            break
        /// 2 - Waiting for second choice
        case (.madeFirstChoice(let id), .waitingForSecondChoice):
            montyHallProblem.firstChoice(id)
            scene.panel.askForSecondChoice(openIds: montyHallProblem.getOpenIds(),
                                     chosendId: montyHallProblem.getChoosenId(),
                                     switchId: montyHallProblem.getSwitchId())
            /// UI Update
            scene.waitingForSecondChoice()
        /// 3 - Ended
        case (.madeSecondChoice(let choice), .ended):
            let didWin = montyHallProblem.secondChoice(choice)
            scene.panel.displayResults(didWin: didWin, results: montyHallProblem.results)
            montyHallProblem.openAll()
            /// UI Update
            scene.ended(choice)
        /// 4 - Reset
        case (.reset, .waitingForFirstChoice):
            montyHallProblem.reset()
            /// UI Update
            scene.waitingForFirstChoice()
        default:
            break
        }
    }
}
