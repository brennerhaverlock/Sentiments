//
//  AppButton.swift
//  Created by Kyle Weiner on 2/4/16.
//

import UIKit

/// A `UIButton` subclass with "springy" touch behavior.

class AppButton: UIButton, TouchAnimatable {
    var touchDownHandler: (() -> Void)?
    var touchUpHandler: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setup()
    }

    // MARK: - User Interaction

    fileprivate func setup() {
        adjustsImageWhenHighlighted = false

        addTarget(self, action: #selector(didTouchDown), for: [.touchDown, .touchDragInside])
        addTarget(self, action: #selector(didTap), for: .touchUpInside)
        addTarget(self, action: #selector(didCancelTouch), for: [.touchCancel, .touchDragOutside])
    }

    @objc func didTouchDown() {
        animateTouchDown()
        touchDownHandler?()
    }

    func didTouchUp() {
        animateTouchUp()
        touchUpHandler?()
    }

    @objc func didCancelTouch() {
        animateTouchUp()
    }

    @objc func didTap() {
        didTouchUp()
    }
}
