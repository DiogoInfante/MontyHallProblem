//
//  BaseViewController.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 30/10/21.
//

import UIKit

/// A BaseViewController class that is used to implement new ViewControllers.
/// It is based on a view that is received at init that is the main container of other subviews.
class BaseViewController: UIViewController {
    /// Main View
    var myView: AssetView<UIView>
    /// Initializes a new ViewController with the provided View.
    /// Parameters:
    ///    - mainView: The View displayed by the ViewController
    /// - Returns: A new ViewController with the provided View.
    init(asset: Asset = .background) {
        self.myView = AssetView()
        super.init(nibName: nil, bundle: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        view.addSubview(myView)
        myView.constraint(to: self.view)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
