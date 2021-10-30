//
//  AssetView.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 30/10/21.
//

import UIKit

/// Asset View is a custom view which inherits from UIImageView.
/// It has a generic typed UIView as a subview.
/// The respective subview will be on front of the asset on the hierarchy and inherits parents contraints.
class AssetView<T: UIView>: UIImageView {
    /// Generic typed UIView.
    var subView: T
    /// Scale of the subview in reference to parent.
    var scale: CGFloat
    /// Initializes a asset view.
    ///     - asset: Asset to be given as background image.
    ///     - subView: Type of subview - should conform with UIView.
    ///     - scale: In reference to parent view.
    /// - Returns: A asset view containing a custom subview and a background image view.
    init(_ asset: Asset = .empty, subView: T = T(), _ scale: CGFloat = 1) {
        self.subView = subView
        self.scale = scale
        super.init(image: Asset.get(asset))
        self.isUserInteractionEnabled = true
        setup(subView)
    }
    /// Setups subView.
    /// - Parameters:
    ///     - subView: A generic UIView.
    func setup<T: UIView>(_ subView: T) {
        self.addSubview(subView)
        subView.constraint(to: self, multiplier: self.scale)
    }
    /// Updates background image.
    /// - Parameters:
    ///     - newAsset: A asset that corresponds to the new image
    func update(_ newAsset: Asset) {
        self.image = Asset.get(newAsset)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
