//
//  PDPlayerView.swift
//  PDVideoPlayer
//
//  Created by Paul-Daniel DOBREA on 27.07.2021.
//

import UIKit

internal class PDPlayerView: UIView {

	var parent: PDVideoPlayer?
	var resizable: Bool = false {
		didSet {
			pinchGesture.isEnabled = resizable
		}
	}
	var movable: Bool = false {
		didSet {
			panGesture.isEnabled = movable
		}
	}
	private let pinchGesture = UIPinchGestureRecognizer()
	private let panGesture = UIPanGestureRecognizer()
	internal var width = NSLayoutConstraint()
	internal var height = NSLayoutConstraint()
	internal var centerX = NSLayoutConstraint()
	internal var centerY = NSLayoutConstraint()
	internal var maxWidth: CGFloat = 0.0
	internal var maxHeight: CGFloat = 0.0
	internal var startWidth: CGFloat = 0.0
	internal var startHeight: CGFloat = 0.0
	internal var panStartPoint: CGPoint = .zero
	internal var startCenterX: CGFloat = 0.0
	internal var startCenterY: CGFloat = 0.0

	init(parent: PDVideoPlayer) {
		self.parent = parent
		super.init(frame: CGRect.zero)
		addGesture(pinchGesture, withSelector: #selector(pinchAction(_:)))
		addGesture(panGesture, withSelector: #selector(panAction(_:)))
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func didMoveToSuperview() {
		super.didMoveToSuperview()
		if superview == nil {
			parent?.remove()
		}
	}

	func add(toSuperview superview: UIView) {
		maxWidth = superview.frame.size.width
		maxHeight = superview.frame.size.height
		translatesAutoresizingMaskIntoConstraints = false
		superview.addSubview(self)
		width = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: superview.frame.width)
		height = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: superview.frame.height)
		addConstraints([width, height])
		centerX = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: 1.0, constant: 0.0)
		centerY = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: superview, attribute: .centerY, multiplier: 1.0, constant: 0.0)
		superview.addConstraints([centerX, centerY])
	}

	private func addGesture(_ gesture: UIGestureRecognizer, withSelector selector: Selector) {
		gesture.isEnabled = false
		gesture.addTarget(self, action: selector)
		addGestureRecognizer(gesture)
	}

}
