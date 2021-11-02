//
//  BaseViewController.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 30/10/21.
//

import UIKit

/// A BaseViewController class that is used to implement new ViewControllers.
/// It is based on a view that is received at init that is the main container of other subviews.
class BaseViewController<T:NavegationView>: UIViewController {
    /// Scene
    var scene: T
    /// Content View
    var contentView: AssetView<UIView>
    /// Initializes a new ViewController with the provided View.
    /// Parameters:
    ///    - mainView: The View displayed by the ViewController
    /// - Returns: A new ViewController with the provided View.
    init(asset: Asset = .background, scene: T) {
        self.contentView = AssetView()
        self.scene = scene
        super.init(nibName: nil, bundle: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        /// View Setup
        self.view.backgroundColor = .mPallete1
        self.navigationController?.navigationBar.isHidden = true
        /// Hier 1 - Main View
        view.addSubview(contentView)
        contentView.constraint(to: self.view)
        /// Button targes
        scene.topBar.sound.subView.addTarget(self, action: #selector(toggleMusic), for: .touchUpInside)
        scene.topBar.pop.subView.addTarget(self, action: #selector(pop), for: .touchUpInside)
    }
    /// Updates disco icon according to soundtrack status
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scene.topBar.toggleDisco(audioManager.player.isPlaying)
    }
    /// Toggles music
    @objc func toggleMusic() {
        audioManager.toggleMusic()
        scene.topBar.toggleDisco(audioManager.player.isPlaying)
    }
    /// Pop VC
    @objc func pop() {
        self.navigationController?.popViewController(animated: true)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
