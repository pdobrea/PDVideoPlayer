//
//  PDVideoPlayer+ViewManagement.swift
//  PDVideoPlayer
//
//  Created by Paul-Daniel DOBREA on 22.07.2021.
//

import AVKit

extension PDVideoPlayer {

	func add(inViewController viewController: UIViewController, container: UIView) {
		viewController.addChild(controller)
		addVideo(toView: container)
	}

	private func addVideo(toView container: UIView) {
		let playerView = PDPlayerView(parent: self)
		playerView.add(toSuperview: container)
		add(subview: controller.view, toSuperview: playerView)
		self.playerView = playerView
	}

	private func add(subview: UIView, toSuperview superview: UIView) {
		subview.translatesAutoresizingMaskIntoConstraints = false
		superview.addSubview(subview)
		let leading = NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1.0, constant: 0.0)
		let trailing = NSLayoutConstraint(item: superview, attribute: .trailing, relatedBy: .equal, toItem: subview, attribute: .trailing, multiplier: 1.0, constant: 0.0)
		let top = NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1.0, constant: 0.0)
		let bottom = NSLayoutConstraint(item: superview, attribute: .bottom, relatedBy: .equal, toItem: subview, attribute: .bottom, multiplier: 1.0, constant: 0.0)
		superview.addConstraints([leading, trailing, top, bottom])
	}

	func remove() {
		controller.removeFromParent()
		playerView?.removeFromSuperview()
		playerView?.parent = nil
	}

}
