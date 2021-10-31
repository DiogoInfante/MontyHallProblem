//
//  StateMachine.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 30/10/21.
//

import UIKit

protocol GameInteractorObserver {
    func changingStateFor(event: GameEvent,
                          from oldState: GameState,
                          to newState: GameState)
    func receiveError(event: ErrorEvent, at currentState: GameState)
}
class GameInteractor {
    static let interactor = Interactor()
    class Interactor {
        /// Current State
        private(set) var currrentState: GameState = .idle
        /// Set Observer
        private var currentObserverVC: GameInteractorObserver? {
            UIApplication.getTopViewController() as? GameInteractorObserver
        }
        fileprivate init(){}
        /// State Change
        private func changeState(with event: GameEvent, to newState: GameState) {
            guard let vc = currentObserverVC else { return }
            debugPrint("Event:", event, "State changed from:", currrentState, "to:", newState)
            vc.changingStateFor(event: event, from: currrentState, to: newState)
            print(currrentState)
            currrentState = newState
            print(currrentState)
        }
        func start() {
            changeState(with: .start, to: .waitingForFirstChoice)
        }
        func madeFirstChoice(_ id: Int) {
            changeState(with: .madeFirstChoice(id), to: .waitingForSecondChoice)
        }
        func madeSecondChoice(_ choice: SecondChoice) {
            changeState(with: .madeSecondChoice(choice), to: .ended)
        }
        func reset() {
            changeState(with: .reset, to: .waitingForFirstChoice)
        }
    }
}
