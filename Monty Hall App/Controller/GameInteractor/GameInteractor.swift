//
//  StateMachine.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 30/10/21.
//

import UIKit

/// Observer protocol
protocol GameInteractorObserver {
    func changingStateFor(event: GameEvent,
                          from oldState: GameState,
                          to newState: GameState)
    func receiveError(event: ErrorEvent, at currentState: GameState)
}
/// Game Interactor is a State Machine responsible to deal with states and events
/// It coordinates all in game interactions
class GameInteractor {
    static let interactor = Interactor()
    class Interactor {
        /// Current State
        private(set) var currrentState: GameState = .idle
        /// Set Observer
        private var currentObserverVC: GameInteractorObserver? {
            UIApplication.getTopViewController() as? GameInteractorObserver
        }
        fileprivate init() { }
        /// State Change
        private func changeState(with event: GameEvent, to newState: GameState) {
            guard let vc = currentObserverVC else { return }
            debugPrint("Event:", event, "State changed from:", currrentState, "to:", newState)
            vc.changingStateFor(event: event, from: currrentState, to: newState)
            currrentState = newState
        }
        /// 1 - Start from .waiting for first choice
        func start() {
            changeState(with: .start, to: .waitingForFirstChoice)
        }
        /// 2 - Made first choice
        func madeFirstChoice(_ id: Int) {
            changeState(with: .madeFirstChoice(id), to: .waitingForSecondChoice)
        }
        /// 3 - Made second choice
        func madeSecondChoice(_ choice: SecondChoice) {
            changeState(with: .madeSecondChoice(choice), to: .ended)
        }
        /// 4 - Reset
        func reset() {
            changeState(with: .reset, to: .waitingForFirstChoice)
        }
    }
}
