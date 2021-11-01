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
protocol ExperimentVCFactory {
    func makeExperimentVC() -> ExperimentVC
}
protocol TutorialVCFactory {
    func makeTutorialVC() -> TutorialVC
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
extension AppContainer: ExperimentVCFactory {
    func makeExperimentVC() -> ExperimentVC {
        return ExperimentVC()
    }
}
extension AppContainer: TutorialVCFactory {
    func makeTutorialVC() -> TutorialVC {
        return TutorialVC()
    }
}

