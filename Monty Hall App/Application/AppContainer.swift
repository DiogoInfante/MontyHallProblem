//
//  AppContainer.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 30/10/21.
//

import Foundation

protocol PuzzleVCFactory {
    func makePuzzleVC() -> PuzzleVC
}
class AppContainer {
}
extension AppContainer: PuzzleVCFactory {
    func makePuzzleVC() -> PuzzleVC {
        return PuzzleVC()
    }
}
