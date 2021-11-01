//
//  HomeVC.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 31/10/21.
//

import UIKit

/// HomeVC is the first page of the app.
class HomeVC: BaseViewController {
    /// Available factories.
    typealias Factory = PuzzleVCFactory & ExperimentVCFactory & TutorialVCFactory
    let factory: Factory
    /// Home Scene/
    var scene: HomeView = HomeView()
    /// Selection index
    var selectionId: Int = 0
    /// Initializes a HomeVC.
    init(factory: Factory) {
        self.factory = factory
        super.init()
    }
    /// View did load cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        /// Background
        self.myView.update(.background)
        /// Scene construction.
        view.addSubview(scene)
        /// Scene constraints: To allow scene width reach the border
        sceneConstraints()
        /// Button Targets
        scene.menu.button.subView.addTarget(self, action: #selector(tappedPlay), for: .touchUpInside)
        scene.menu.nextItem.subView.addTarget(self, action: #selector(tappedNext), for: .touchUpInside)
        scene.menu.lastItem.subView.addTarget(self, action: #selector(tappedLast), for: .touchUpInside)
    }
    @objc func tappedPlay() {
        if selectionId == 0 {
            let puzzleVC = factory.makePuzzleVC()
            self.navigationController?.pushViewController(puzzleVC, animated: true)
        } else if selectionId == 1 {
            let experimentVC = factory.makeExperimentVC()
            self.navigationController?.pushViewController(experimentVC, animated: true)
        } else {
            let tutorialVC = factory.makeTutorialVC()
            self.navigationController?.pushViewController(tutorialVC, animated: true)
        }
    }
    @objc func tappedNext() {
        selectionId += 1
        scene.menu.didSelect(selectionId)
    }
    @objc func tappedLast() {
        selectionId -= 1
        scene.menu.didSelect(selectionId)
    }
    fileprivate func sceneConstraints() {
        scene.translatesAutoresizingMaskIntoConstraints = false
        scene.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        scene.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        scene.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scene.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
