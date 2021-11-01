//
//  TutorialVC.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 01/11/21.
//

import UIKit

/// Tutorial View Controller
/// This page explains the solution to monty hall problem
class TutorialVC: BaseViewController {
    /// Tutorial Scene
    var scene: TutorialView = TutorialView()
    /// Initializes a TutorialVC.
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
