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
    typealias Factory = PuzzleVCFactory
    let factory: Factory
    /// Home Scene/
    var scene: HomeView = HomeView()

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
        scene.setScene(root: view)
        scene.menu.subView.addTarget(self, action: #selector(tappedPlay), for: .touchUpInside)
    }
    @objc func tappedPlay() {
        let puzzleVC = factory.makePuzzleVC()
        self.navigationController?.pushViewController(puzzleVC, animated: true)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
