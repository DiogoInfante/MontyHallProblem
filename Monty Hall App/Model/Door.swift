//
//  Door.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 17/02/21.
//

import Foundation

/// Oberserver Protocol
/// stateUpdated: Sends a message of door state update
/// prizeUpdated: Sends a message of prize state update
protocol ObserverProtocol: AnyObject {
    func stateUpdated(_ newState: DoorState)
    func prizeUpdated(_ isPrized: Bool)
}
/// Door Model: Subject
class Door {
    /// id
    let id: Int
    /// State: Initializes closed
    private var _state: DoorState = .closed
    /// isPrized: Indicates if the door is prized
    private var _isPrized: Bool = false
    /// Update state notifying observer
    var state: DoorState {
        get {
            return _state
        }
        set {
            _state = newValue
            notifyObserver()
        }
    }
    /// Update prize notifying observer
    var isPrized: Bool {
        get {
            return _isPrized
        }
        set {
            _isPrized = newValue
            notifyObserver()
        }
    }
    /// Initializes a Door
    /// - Parameters: id: Door id
    init(_ id: Int) {
        self.id = id
    }
    /// Observer
    weak var observer: ObserverProtocol?
    /// Notification
    private func notifyObserver() {
        observer?.stateUpdated(_state)
        observer?.prizeUpdated(_isPrized)
    }
    static let null = Door(-1)
}
/// Doors States
enum DoorState {
    case opened
    case closed
    /// Toggle function changes a coord state
    mutating func toggle() {
        self = self == .opened ? .closed : .opened
    }
}
