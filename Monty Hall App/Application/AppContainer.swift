//
//  AppContainer.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 30/10/21.
//

import Foundation

protocol HomeVCFactory {
    func makeHomeVC() -> HomeVC
}
protocol PuzzleVCFactory {
    func makePuzzleVC() -> PuzzleVC
}
class AppContainer {
}
extension AppContainer: HomeVCFactory {
    func makeHomeVC() -> HomeVC {
        return HomeVC(factory: self)
    }
}
extension AppContainer: PuzzleVCFactory {
    func makePuzzleVC() -> PuzzleVC {
        return PuzzleVC()
    }
}

