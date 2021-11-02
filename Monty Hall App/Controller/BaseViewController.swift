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
    /// sound Track Player
    let soundTrack = AudioPlayer()
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
        /// Hier 2 - Scene View
        view.addSubview(scene)
        scene.setScene(root: contentView)
    }
    /// Toggles music
    @objc func toggleMusic() {
        if soundTrack.isPlaying {
            
        } else {
            soundTrack.play(Tracklist.soundtrack)
        }
    }
    /// Pop VC
    @objc func pop() {
        self.navigationController?.popViewController(animated: true)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
