//
//  AppContainer.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 30/10/21.
//

import Foundation

/// App container factories procotols
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
/// App container
class AppContainer {
}
/// VCs creator functions
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
