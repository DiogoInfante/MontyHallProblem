//
//  GameEvent.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 30/10/21.
//

import Foundation

enum GameEvent: Equatable {
    case start
    case madeFirstChoice(Int)
    case madeSecondChoice(SecondChoice)
    case reset
}
