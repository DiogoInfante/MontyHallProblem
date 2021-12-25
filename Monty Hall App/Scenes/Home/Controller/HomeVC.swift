//
//  HomeVC.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 31/10/21.
//

import UIKit

/// HomeVC is the first page of the app.
/// It contains a menu to navigate in between pages.
/// Also has the tiltle and some images.
class HomeVC: BaseViewController<HomeView> {
    /// Available factories.
    typealias Factory = PuzzleVCFactory & ExperimentVCFactory & TutorialVCFactory
    let factory: Factory
    /// Selection index:
    ///     - 0: Puzzle
    ///     - 1: Experiment
    ///     - 2: Tutorial
    var selectionId: Int = 0
    /// Initializes a HomeVC.
    init(factory: Factory) {
        self.factory = factory
        super.init(scene: HomeView())
    }
    /// View did load cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        /// Background
        self.contentView.update(.background)
        /// Scene Setup
        view.addSubview(scene)
        /// Scene constraints: To allow scene width reach the border
        sceneConstraints()
        /// Button Targets
        scene.menu.button.subView.addTarget(self, action: #selector(tappedNavegation), for: .touchUpInside)
        scene.menu.nextArrow.subView.addTarget(self, action: #selector(tappedNext), for: .touchUpInside)
        scene.menu.backArrow.subView.addTarget(self, action: #selector(tappedLast), for: .touchUpInside)
    }
    /// Called when menu button is pressed
    /// It pushes to the view controller refered to selection id
    @objc func tappedNavegation() {
        if selectionId == 0 {
            let puzzleVC = factory.makePuzzleVC()
            self.navigationController?.pushViewController(puzzleVC, animated: true)
        } else if selectionId == 1 {
            let experimentVC = factory.makeExperimentVC()
            self.navigationController?.pushViewController(experimentVC, animated: true)
        } else {
            /// let tutorialVC = factory.makeTutorialVC()
            /// self.navigationController?.pushViewController(tutorialVC, animated: true)
            displayAlert(message: "Problem Explanation")
        }
    }
    /// TEMPORARY as the multiplayer is Developed
    func displayAlert(message: String) {
        let alert = UIAlertController(title: "Coming Soon", message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    /// Tapped Next arrow
    @objc func tappedNext() {
        if selectionId < 2 {
            selectionId += 1
            scene.menu.didSelect(selectionId)
        }
    }
    /// Tapped Last arrow
    @objc func tappedLast() {
        if selectionId > 0 {
            selectionId -= 1
            scene.menu.didSelect(selectionId)
        }
    }
    /// Add scene constraints to allow width constrained to view
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
