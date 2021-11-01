//
//  TutorialVC.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 01/11/21.
//

import UIKit

/// Experiment
class TutorialVC: BaseViewController {
    /// Home Scene/
    var scene: TutorialView = TutorialView()
    /// Initializes a HomeVC.
    init() {
        super.init()
    }
    /// View did load cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        /// Background
        self.myView.update(.smoothBackground)
        /// Scene construction
        view.addSubview(scene)
        scene.setScene(root: view)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
